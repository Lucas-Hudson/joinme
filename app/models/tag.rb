class Tag < ApplicationRecord
    has_many :join_tag_venues
    has_many :venues, through: :join_tag_venues
end
