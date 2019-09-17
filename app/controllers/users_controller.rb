class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @friends_count = @user.friends.count
        puts "$"*40
        params[:notif]
        puts "$"*40
        if params[:notif]
          FriendshipNotification.find(params[:notif]).update(is_read?: true)
        end

    end

  def index
    # Show all users who aren't the current_user's friends
    @users_to_add = User.all - Array(current_user) - current_user.friends - current_user.sent_friend_requests
    @sent_friend_requests = current_user.sent_friend_requests
  end

    def edit 
      @user = current_user
    end



    def update
        @user = current_user
        if user_update[:avatar] #Evite l'erreur si le user edite son profil sans éditer sa photo
          @user.avatar.attach(user_update[:avatar])
        end

        @user.update(user_update)
        redirect_to user_path(@user.id)
    end

    private
    def user_update
        params.require(:user).permit(:first_name, :last_name, :email, :date_of_birth, :description, :avatar, user: current_user)
    end
end
