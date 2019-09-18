class Admin::OwnersController < Admin::BaseController
  
  def index
    @users = User.where(is_owner?:true)
  end

  def create #Add user as admin
    @user = User.find_by(email: params[:email])
    if @user && @user.update(is_owner?: true)
        redirect_to admin_owners_path
        flash[:success] = ":#{@user.first_name} #{@user.last_name}: now has owner rights and can create venues"
    else
        redirect_to admin_owners_path
        flash[:error] = "Could not find this email address in the database"
    end
  end

  def update
      @user = User.find(params[:id])

      if @user.update(is_owner?: false)
              redirect_to admin_owners_path
              flash[:success] = "owner rights have been removed from the user :#{@user.email}:"
          else
              flash[:success] = "Impossible to remove owner rights from this user right now, try later"
      end     
  end

end
