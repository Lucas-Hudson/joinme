class CreateUserInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_invites do |t|
      t.belongs_to :invitation
      t.belongs_to :guest
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
