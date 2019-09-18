class Admin::UsersController < Admin::BaseController
  def index
     @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @email = @user.email
    @fname = @user.first_name
    @lname = @user.last_name
  end

  def update
    @user = User.find(params[:id])
    if @user.update(is_admin?: true)
      redirect_to admin_users_path
      flash[:success] = "User :#{@user.email}: has been added as an administrator. If it was unintentional, simply go to the Manage Administrators dashboard page and delete the admin rights for this user."
    end
    end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path
      flash[:danger] = "User :#{@user.email}: has been deleted from the database"
    end
  end

end
