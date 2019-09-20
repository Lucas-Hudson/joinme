require 'rails_helper'
RSpec.describe Friendship, type: :model do
    before(:each) do 
    @user1 = User.create(first_name: "John", last_name: "Doe", email: "jd1@gmail.com", password: 123456)
    @user2 = User.create(first_name: "Jane", last_name: "Doe", email: "jd2@gmail.com", password: 123456)
    @friendship = Friendship.create(user: @user1, friend: @user2)
    @count = Friendship.count
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
                @reverse_friendship = Friendship.find_by(user: @friendship.friend, friend: @friendship.user)              
                expect(Friendship.exists?(@reverse_friendship.id)).to be true
            end
            it "should destroy both friendships" do
                @friendship.destroy
                @count_after_destroy = Friendship.count
                expect(@count_after_destroy).to equal(@count-2)
            end  
    end
  end
end




