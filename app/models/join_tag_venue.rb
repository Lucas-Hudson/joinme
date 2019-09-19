class JoinTagVenue < ApplicationRecord
    belongs_to :tag
    belongs_to :venue
end
