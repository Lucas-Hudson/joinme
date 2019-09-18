class ApplicationController < ActionController::Base

    include Devise::Controllers::Helpers  #Nous permet d'accéder depuis le controller aux variables devise (current_user)
    before_action :authenticate_user! #All pages are blocked and only signed in users can access it (except)
    helper_method :avatar
    helper_method :received_notifications
    helper_method :unread_notifications
    helper_method :notification_color
    # Initiates variables before loading page. Otherwise the variable comes back nil...
unless current_user == nil
before_action :set_constants

    def set_constants
      @current_events_as_guest = []
      @past_events_as_guest = []
      @events_as_guest = UserInvite.where(guest: current_user)

      if @events_as_guest != nil
        @events_as_guest.each do |user_invite|
          if user_invite.invitation.start_date == Date.today
            @current_events_as_guest << user_invite.invitation
          else
            @past_events_as_guest << user_invite.invitation
          end
        end
      end
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
