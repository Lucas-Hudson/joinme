class UserInvitesController < ApplicationController
  def create
    puts "*" * 50
    UserInvite.create(invitation_id: params[:invitation], guest_id: params[:guest])
    puts "*" * 50
  end
end
