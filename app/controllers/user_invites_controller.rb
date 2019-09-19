class UserInvitesController < ApplicationController

  def new
    # If the current_user is admin of a current event at the venue on which he/she clicked
    if current_user.events.current.find_by(venue: params[:format])
      @invitation = current_user.current_events_as_admin.find_by(venue: params[:format])
      @friends_to_invite = current_user.friends - current_user.sent_friend_requests - @invitation.guests
    else
      @friends_to_invite = current_user.friends - current_user.sent_friend_requests
    end

  end

  def create

      if params[:invitation_id]
        @invitation = Invitation.find(params[:invitation_id])
        UserInvite.create(invitation_id: params[:invitation_id], guest_id: params[:guest_id])
      else
        if current_user.current_events_as_admin.find_by(venue_id: params[:venue_id])
          @invitation = current_user.current_events_as_admin.find_by(venue: params[:venue_id])
          UserInvite.create(invitation_id: @invitation.id, guest_id: params[:guest_id])
        else
          @invitation = Invitation.create(admin_id: current_user.id, venue_id: params[:venue_id], start_date: Date.today)
          UserInvite.create(invitation_id: Invitation.last.id, guest_id: params[:guest_id])
        end
      end

      InvitationNotification.create!(actor: current_user, recipient_id: params[:guest_id], action_id: 4, reference: @invitation.venue)
  end

  def update
    @user_invite = UserInvite.find_by(invitation_id: params[:id], guest: current_user)
    @invitation = @user_invite.invitation
    @user_invite.update(status: params[:status])
    if params[:status] == 1
      InvitationNotification.create!(actor: current_user, recipient: @invitation.admin, action_id: 4, reference: @invitation.venue)
    elsif params[:status] == 2
      InvitationNotification.create!(actor: current_user, recipient: @invitation.admin, action_id: 5, reference: @invitation.venue)
    end      
  end



end
