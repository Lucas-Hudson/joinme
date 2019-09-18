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
