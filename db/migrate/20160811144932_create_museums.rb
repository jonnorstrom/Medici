class CreateMuseums < ActiveRecord::Migration[5.0]
  def change
    create_table :museums do |t|
      t.string :name, uniqueness: true
      t.string :blurb
      t.string :description
      t.float :price
      t.boolean :active
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
