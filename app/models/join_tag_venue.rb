class JoinTagVenue < ApplicationRecord
    belongs_to :tag
    belongs_to :venue
    validates_uniqueness_of :tag, scope: :venue_id
end
