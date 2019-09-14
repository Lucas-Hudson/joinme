class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.belongs_to :owner
      t.string :name
      t.text :description
      t.integer :min_drink_price
      t.string :address
      t.string :city
      t.string :zip_code
      t.boolean :food #is there things to eat there
      t.timestamps
    end
  end
end
