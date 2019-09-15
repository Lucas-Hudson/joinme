class ApplicationController < ActionController::Base
    include Devise::Controllers::Helpers  #Nous permet d'accéder depuis le controller aux variables devise (current_user)
    before_action :authenticate_user! #All pages are blocked and only signed in users can access it (except)
    helper_method :current_user_avatar

    #Allows us to grab current_user profile pic in all cases (if there is no attached avatars, we display a default avatar)
    def current_user_avatar
        if current_user.avatar.attached?
            avatar = current_user.avatar
        else
            avatar = "https://joinme-thp.s3-eu-west-1.amazonaws.com/avatar.jpg"
        end
    end

    def after_sign_in_path_for(resource)
        edit_user_path(current_user.id)
    end

end
