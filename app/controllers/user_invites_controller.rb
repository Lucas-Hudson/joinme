class UserInvitesController < ApplicationController
  def create
    @venue_reference = Invitation.find(params[:invitation_id]).venue.name
    UserInvite.create(invitation_id: params[:invitation_id], guest_id: params[:guest_id])
    InvitationNotification.create(actor: current_user, recipient_id: params[:guest_id], reference: @venue_reference)
  end
end
