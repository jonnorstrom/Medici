class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.integer :user_id, :default => 0
      t.integer :museum_id, :default => 0
      t.integer :exhibit_id, :default => 0
      t.integer :tag_id, :default => 0
      t.timestamps
    end
  end
end
