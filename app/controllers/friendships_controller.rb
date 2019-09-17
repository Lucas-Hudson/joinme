class FriendshipsController < ApplicationController

  def index
    @friends = current_user.friends
    @sent_friend_requests = current_user.sent_friend_requests
    @received_friend_requests = current_user.received_friend_requests
  end

  def create
    @requested_friend = User.find(params[:format])
    friendship = Friendship.new(user: current_user, friend: @requested_friend)
    if friendship.save
      FriendshipNotification.create(actor: current_user, recipient: @requested_friend, action_id: 2) #create the notification
    else
      render 'new'
    end

  end

  def update
    @friend_request = Friendship.find_by(user: params[:id], friend: current_user)
    @friend_request.update(status: params[:status])
    FriendshipNotification.create(actor: params[:id], recipient: current_user, action_id: 3) #create the notification
  end

  def destroy
    Friendship.find_by(user: params[:id], friend: current_user).destroy
  end

  private

  def friendship_update
      params.require(:friendships).permit(:status)
  end

end
