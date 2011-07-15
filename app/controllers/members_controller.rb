class MembersController < ApplicationController

	before_filter :authenticate_user!

  def index
	/@members = User.all(:select => "users.id, users.name, count(answers.user_id)", 
						:joins => :answers, 
						:group => "answers.user_id", 
						:order => "count(answers.user_id) desc")/
						
	@members = User.by_active
    respond_with(@members)
  end
end
