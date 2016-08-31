class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :blurb
      t.string :description
      t.integer :museum_id
      t.timestamps
    end
  end
end
