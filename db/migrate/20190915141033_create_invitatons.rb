class CreateInvitatons < ActiveRecord::Migration[5.2]
  def change
    create_table :invitatons do |t|
      t.belongs_to :admin 
      t.belongs_to :venue
      t.datetime :start_date
      t.boolean :is_finished, default: false
      t.timestamps
    end
  end
end
