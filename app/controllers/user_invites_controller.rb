class UserInvitesController < ApplicationController

  def create
    UserInvite.create(invitation_id: params[:invitation], guest_id: params[:guest])
  end
end
