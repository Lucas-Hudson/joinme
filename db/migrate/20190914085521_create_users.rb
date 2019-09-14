class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :date_of_birth
      t.string :phone_number
      t.integer :rank
      t.integer :points
      t.boolean :is_admin?, default: false
      t.boolean :is_owner?, default: false
      t.timestamps
    end
  end
end
