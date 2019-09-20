require 'rails_helper'
RSpec.describe Friendship, type: :model do
    before(:each) do 
    @user1 = User.create(first_name: "John", last_name: "Doe", email: "jd1@gmail.com", password: 123456)
    @user2 = User.create(first_name: "Jane", last_name: "Doe", email: "jd2@gmail.com", password: 123456)
    @friendship = Friendship.create(user: @user1, friend: @user2)
    @reverse_friendship = Friendship.find_by(user: @friendship.friend, friend: @friendship.user)
  end
  context "validations" do
    it "is valid with valid attributes" do
      expect(@friendship).to be_a(Friendship)
        expect(@friendship).to be_valid
        end
  end
  context "callbacks" do
    describe "after_update reverse friendship" do
            it "should create reverse friendship" do
                @friendship.update(status: "accepted")
                
                expect(@reverse_friendship) 
            end
            it "should destroy both friendships" do
                @friendship.destroy
                expect(@reverse_friendship).to be_nil
            end
            
    end
  end
end




