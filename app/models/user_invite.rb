class UserInvite < ApplicationRecord
    belongs_to :invitation
    belongs_to :guest, :class_name => "User"
end
