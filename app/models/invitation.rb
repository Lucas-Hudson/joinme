class Invitation < ApplicationRecord
    belongs_to :admin, :class_name => "User"
    belongs_to :venue
    has_many :user_invite
    has_many :guests, :through => :user_invite
end
