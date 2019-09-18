class Admin::AdministratorsController < Admin::BaseController

    def index
        @users = User.where(is_admin?: true)
    end

    def update
        @user = User.find(params[:id])

        # when clicking add administrator we pass a hidden param[:create], when deleting admin rights we pass a hidden param[:delete]
        if params[:delete]
            if @user.update(is_admin?: false)
                redirect_to admin_administrators_path
                flash[:success] = "Administrator rights have been removed from the user :#{@user.email}:"
            else
                flash[:success] = "Impossible to remove admin rights from this user right now, try later"
            end
        elsif params[:create]
            if @user.update(is_admin?: true)
                redirect_to admin_administrators_path
                flash[:success] = ":#{@user.first_name} #{@user.last_name}: now has administrator rights and can access the dashboard"
            else
                flash[:success] = "Impossible to add user as admin, try later"
            end
        end
    end
end
