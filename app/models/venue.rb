class Venue < ApplicationRecord
    belongs_to :owner, :class_name => "User"
    has_many :invitations
    has_one_attached :avatar
    has_one_attached :video
    has_one_attached :thumbnail
    has_many_attached :images


    has_many :events, -> { where(start_date: Date.today) }, class_name: 'Invitation', foreign_key: :venue_id
    has_many :participants, through: :events, source: :guests

    has_many :join_tag_venues
    has_many :tags, through: :join_tag_venues
end
