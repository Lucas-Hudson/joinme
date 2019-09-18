class Admin::AdministratorsController < Admin::BaseController

    def index
        @users = User.where(is_admin?: true)
    end

    def create #Add user as admin
        @user = User.find_by(email: params[:email])
        if @user && @user.update(is_admin?: true)
            redirect_to admin_administrators_path
            flash[:success] = ":#{@user.first_name} #{@user.last_name}: now has administrator rights and can access the dashboard"
        else
            redirect_to admin_administrators_path
            flash[:error] = "Could not find this email address in the database"
        end
    end

    def update
        @user = User.find(params[:id])

        if @user.update(is_admin?: false)
                redirect_to admin_administrators_path
                flash[:success] = "Administrator rights have been removed from the user :#{@user.email}:"
            else
                flash[:success] = "Impossible to remove admin rights from this user right now, try later"
        end     
    end
end
