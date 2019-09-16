class UserInvitesController < ApplicationController
  def create
    i = params[:invitation_id]
    puts "*" * 50
    puts i
    puts "*" * 50
    UserInvite.create(invitation_id: params[:invitation_id], guest_id: params[:guest_id])

  end
end
