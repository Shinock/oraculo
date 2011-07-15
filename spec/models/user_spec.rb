require 'spec_helper'

describe User do
	describe "Retrieving the by active users" do
      let(:user) {User.by_active}
      
	  it "shoud retrieve the by active" do
        user.should_not == 0
      end
	  
	end
	
end


