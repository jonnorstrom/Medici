class FavorableTags < ActiveRecord::Migration[5.0]
  def change
    create_table :favorable_tags do |t|
      t.integer :tag_id, null: false
      t.integer :event_id
      t.integer :museum_id
      t.integer :exhibit_id
      t.integer :piece_id

      t.timestamps null: false
    end
  end
end
