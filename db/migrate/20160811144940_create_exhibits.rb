class CreateExhibits < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibits do |t|
      t.string :name uniqueness: true
      t.string :blurb
      t.string :description
      t.string :location
      t.date :start_date
      t.date :end_date
      t.integer :museum_id
      t.timestamps
    end
  end
end
