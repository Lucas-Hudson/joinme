class ApplicationController < ActionController::Base
    include Devise::Controllers::Helpers  #Nous permet d'accéder depuis le controller aux variables devise (current_user)
    before_action :authenticate_user! #All pages are blocked and only signed in users can access it (except)
    helper_method :received_notifications
    helper_method :avatar

    #Allows us to grab current_user profile pic in all cases (if there is no attached avatars, we display a default avatar)
    def avatar(avatar_holder)
        if avatar_holder.avatar.attached?
            avatar = avatar_holder.avatar
        else
            avatar = "https://joinme-thp.s3-eu-west-1.amazonaws.com/avatar.jpg"
        end
    end

    #User is redirected to edit page on sign up && on sign in (as long as they don't have a first name)
    def after_sign_in_path_for(resource)
        if current_user.first_name == nil || current_user.first_name.length == 0 #Check if the first_name is not
            edit_user_path(current_user.id)
        else
            root_path
        end
    end

    def received_notifications
        current_user.received_friendship_notifications + current_user.received_invitation_notifications
    end
end
