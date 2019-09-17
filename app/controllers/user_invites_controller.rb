class UserInvitesController < ApplicationController

  def new
    # If the current_user is admin of a current event at the venue on which he/she clicked
    if current_user.current_events_as_admin.find_by(venue: params[:format])
      @invitation = current_user.current_events_as_admin.find_by(venue: params[:format])
      @friends_to_invite = current_user.friends - current_user.sent_friend_requests - @invitation.guests
    else
      @friends_to_invite = current_user.friends - current_user.sent_friend_requests
    end

  end

  def create
      if current_user.current_events_as_admin.find_by(venue: params[:venue_id])
        @invitation = current_user.current_events_as_admin.find_by(venue: params[:venue_id])
        UserInvite.create(invitation_id: @invitation.id, guest_id: params[:guest])
      else
        Invitation.create(admin_id: current_user.id, venue_id: params[:venue_id], start_date: Date.today)
        UserInvite.create(invitation_id: Invitation.last.id, guest_id: params[:guest])
      end
      
      @venue_reference = Invitation.find(params[:invitation]).venue
      InvitationNotification.create!(actor: current_user, recipient_id: params[:guest], action_id: 4, reference: @venue_reference)
  end
end
