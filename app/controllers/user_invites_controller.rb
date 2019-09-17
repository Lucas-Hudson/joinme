class UserInvitesController < ApplicationController
  def create
    @venue_reference = Invitation.find(params[:invitation]).venue
    UserInvite.create(invitation_id: params[:invitation_id], guest_id: params[:guest])
    InvitationNotification.create!(actor: current_user, recipient_id: params[:guest], action_id: 4, reference: @venue_reference)
  end
end
