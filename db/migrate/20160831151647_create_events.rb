class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :blurb
      t.string :description
      t.integer :museum_id
      t.timestamps
    end
  end
end