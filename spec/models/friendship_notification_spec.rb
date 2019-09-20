require 'rails_helper'
RSpec.describe FriendshipNotification, type: :model do
    before(:each) do 
    @user1 = User.create(first_name: "John", last_name: "Doe", email: "jd1@gmail.com", password: 123456)
    @user2 = User.create(first_name: "Jane", last_name: "Doe", email: "jd2@gmail.com", password: 123456)
    @friendship = Friendship.create(user: @user1, friend: @user2)
    @notification = FriendshipNotification.create(actor_id:  @friendship.user, recipient_id:@friendship.friend,  action_id: 2)     
  end
  context "validations" do
    it "is valid with valid attributes" do
      expect(@notification ).to be_a(FriendshipNotification)
        expect(@notification).to be_valid
        end
  end
  

end