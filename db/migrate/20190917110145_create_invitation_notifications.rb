class CreateInvitationNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :invitation_notifications do |t|
      t.boolean :is_read?, default: false
      t.belongs_to :actor
      t.belongs_to :recipient
      t.belongs_to :action
      t.belongs_to :reference
      t.timestamps
    end
  end
end
