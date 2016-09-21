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
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
