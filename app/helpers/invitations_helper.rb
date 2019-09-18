module InvitationsHelper

  def guest_status(invitation, guest)
    find_user_invite = guest.invitations.find_by(invitation: invitation)
    if find_user_invite != nil
      return find_user_invite
    end
  end
end
