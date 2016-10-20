class AddPermanentToExhibits < ActiveRecord::Migration[5.0]
  def change
    add_column :exhibits, :permanent, :boolean
  end
end
