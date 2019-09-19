class Admin::BaseController < ApplicationController
    layout 'admin'
    before_action :check_if_admin

    def check_if_admin
        if !current_user.is_admin?
         redirect_to root_path
         flash.now[:error] = "You need to have admin rights to access this page"
        end
    end
end

# ------- This controller is the equivalent of the application.rb controller but for the admin dashboard ------ 
# ------- It inherits from application_controller.rb and all admin controllers inherit from the Base controller ------