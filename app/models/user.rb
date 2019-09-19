class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :friendships, :dependent => :destroy

  has_many :sent_friendship_requests, -> { where(status: 0) }, class_name: 'Friendship', foreign_key: :user_id
  has_many :sent_friend_requests, through: :sent_friendship_requests, source: :friend

  has_many :received_friendship_requests, -> { where(status: 0) }, class_name: 'Friendship', foreign_key: :friend_id
  has_many :received_friend_requests, through: :received_friendship_requests, source: :user

  # has_many :accepted_friendships, -> { where(status: 1) }, class_name: 'Friendship', foreign_key: :user_id
  # has_many :friends, :through => :accepted_friendships, :source => :friend

  has_many :declined_friendships, -> { where(status: 2) }, class_name: 'Friendship', foreign_key: :user_id
  has_many :declined_friends, through: :declined_friendships, source: :friend

  #invitations
  has_many :events, class_name: 'Invitation', foreign_key: :admin_id

  #user_invite
  has_many :user_invites, foreign_key: :guest_id
  has_many :invitations, through: :user_invites

  #notifications
  has_many :friendship_notifications, :dependent => :destroy
  has_many :received_friendship_notifications, class_name: 'FriendshipNotification', foreign_key: :recipient
  has_many :received_invitation_notifications, class_name: 'InvitationNotification', foreign_key: :recipient
  has_many :unread_friendship_notifications, -> { where(is_read?: false) }, class_name: 'FriendshipNotification', foreign_key: :recipient
  has_many :unread_invitation_notifications, -> { where(is_read?: false) }, class_name: 'InvitationNotification', foreign_key: :recipient

  def friends
    friendships.accepted
  end
end


# User.friends (tous mes amis qui sont statut 1)
# User.friends.sent_requests (tous les demandes d'amis qu'on a envoyé)
# User.friends.received_requests (tous les demandes d'amis qu'on a reçu)
#
# User.sent_invitations
# User.sent_invitations.current (toutes les invites créées qui sont courantes)
#
# User.received_invitations
# User.received_invitations.current (toutes les invites reçues qui sont courantes)
#
# User.received_friendship_notifications
# User.received_invitation_notifications
#
# has_many :unread_friendship_notifications, -> { where(is_read?: false) }, class_name: 'FriendshipNotification', foreign_key: :recipient
# has_many :unread_invitation_notifications, -> { where(is_read?: false) }, class_name: 'InvitationNotification', foreign_key: :recipient
