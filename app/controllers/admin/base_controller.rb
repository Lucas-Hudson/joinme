class Admin::BaseController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

    def authenticate_admin!
        current_user.is_admin?        
    end

end
