require 'rails_helper'

RSpec.describe User, type: :model do

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }

    # describe "::find_by_credentials" do
    #     #create user use (let!)
    #     #should expect the method should user in param = user in test db
    #     #password_digest = plaintext_password
    #     before :each do
    #         subject(:user) { User.create(username: "Austin") }
    #     end  #let! has implicit before
    #     it "should return user if username and password exist" do
            
    #     end

       
    # end
end