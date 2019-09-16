class CreateUserInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_invites do |t|

      t.timestamps
    end
  end
end
