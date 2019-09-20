class NotifActionsController < ApplicationController
  def  index
    @notifs = current_user.received_friendship_notifications + current_user.received_invitation_notifications
  end
end
