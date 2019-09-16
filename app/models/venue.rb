class Venue < ApplicationRecord
    belongs_to :owner, :class_name => "User"
    has_many :invitations
    has_one_attached :video
    has_one_attached :thumbnail
    has_many_attached :images
end
