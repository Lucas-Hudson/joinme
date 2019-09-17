class InvitationNotification < ApplicationRecord
    belongs_to :actor, class_name: "User"
    belongs_to :recipient, class_name: "User"
    belongs_to :action, class_name: "NotifAction"
    belongs_to :reference, class_name: "Venue"
end
