class UsersController < ApplicationController

  def index
    # Show all users who aren't the current_user's friends
    @users = User.all - Array(current_user) - current_user.friends
  end

  def show
      @user = User.find(params[:id])
  end

  def edit
      @user = current_user
  end

  def update
      @user = current_user
      @user.update(user_update)
      redirect_to root_path
  end

  private
  def user_update
      params.require(:user).permit(:first_name, :last_name, :email, :date_of_birth, :description, user: current_user)
  end

end
