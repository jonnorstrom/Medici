class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.time :opening_time
      t.time :closing_time
      t.string :blurb
      t.string :description
      t.float :price
      t.integer :museum_id
      t.string :website
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :transportation_info
      t.boolean :main, default: false
      t.timestamps
    end
  end
end
