class CreateFriendshipNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :friendship_notifications do |t|
      t.boolean :is_read?
      t.belongs_to :actor
      t.belongs_to :recipient
      t.belongs_to :action
      t.timestamps
    end
  end
end
