class Invitation < ApplicationRecord
    belongs_to :admin, :class_name => "User"
    belongs_to :venue
    has_many :user_invites
    has_many :guests, :through => :user_invites

    scope :current, -> { where(start_date: Date.today) }
    scope :past, -> { where('start_date < ?', Date.today) }



end
