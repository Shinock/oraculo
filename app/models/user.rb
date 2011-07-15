class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :questions
  has_many :answers

  validates_presence_of :name
  
  def self.by_active
	fields = "users.id, users.name, count(user_id) as answer_counter"    
	select(fields).joins(:answers).group("user_id").order("answer_counter desc")
  end
end
