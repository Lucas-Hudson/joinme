class ApplicationController < ActionController::Base
    include Devise::Controllers::Helpers  #Nous permet d'accéder depuis le controller aux variables devise (current_user)
    before_action :authenticate_user! #All pages are blocked and only signed in users can access it (except)
    helper_method :current_user_avatar

    def current_user_avatar
        if current_user.avatar.attached?
            avatar = current_user.avatar
        else
            avatar = "https://joinme-thp.s3-eu-west-1.amazonaws.com/avatar.jpg"
        end
    end

end
