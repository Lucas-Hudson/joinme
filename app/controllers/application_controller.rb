class ApplicationController < ActionController::Base
    protect_from_forgery
    include Devise::Controllers::Helpers  #Nous permet d'accéder depuis le controller aux variables devise (current_user)
    before_action :authenticate_user! #All pages are blocked and only signed in users can access it (except)
    helper_method :avatar
    helper_method :received_notifications
    helper_method :unread_notifications
    helper_method :notification_color
    # Initiates variables before loading page. Otherwise the variable comes back nil...
    before_action :set_constants

    def set_constants
      if user_signed_in?
        @current_events_as_admin = current_user.events.current
        @current_events_as_guest = current_user.invitations.current

        @past_events_as_admin = current_user.events.past
        @past_events_as_guest = current_user.invitations.past

        @current_event_count = @current_events_as_admin.count + @current_events_as_guest.count
        @past_events = @past_events_as_admin + @past_events_as_guest
      end
    end

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

    def unread_notifications
        current_user.unread_friendship_notifications + current_user.unread_invitation_notifications
    end

    def notification_color(notif)
      if notif.is_read?
        "white"
      else
        "#EFF1F3"
      end
    end

end
