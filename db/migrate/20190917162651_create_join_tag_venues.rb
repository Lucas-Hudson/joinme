class CreateJoinTagVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :join_tag_venues do |t|
      t.belongs_to :tag, index:true
      t.belongs_to :venue, index: true
      t.timestamps
    end
  end
end
