class User < ApplicationRecord
  require 'time'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  #friendship
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :source => :friend
  has_many :sent_friendship_requests, -> { where(status: 0) }, class_name: 'Friendship', foreign_key: :user_id
  has_many :sent_friend_requests, through: :sent_friendship_requests, source: :friend
  has_many :received_friendship_requests, -> { where(status: 0) }, class_name: 'Friendship', foreign_key: :friend_id
  has_many :received_friend_requests, through: :received_friendship_requests, source: :user
  has_many :accepted_friendships, -> { where(status: 1) }, class_name: 'Friendship', foreign_key: :user_id
  has_many :friends, :through => :accepted_friendships, :source => :friend
  has_many :declined_friendships, -> { where(status: 2) }, class_name: 'Friendship', foreign_key: :user_id
  has_many :declined_friends, through: :declined_friendships, source: :friend
  ##########
  #invitations
  has_many :invitations
  ###########
  #user_invite
  has_many :user_invite
  has_many :current_events_as_admin, -> { where(start_date: Date.today) }, class_name: 'Invitation', foreign_key: :admin_id
  has_many :past_events_as_admin, -> { where.not(start_date: Date.today) }, class_name: 'Invitation', foreign_key: :admin_id

end
