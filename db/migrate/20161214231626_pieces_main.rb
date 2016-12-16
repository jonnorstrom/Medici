class PiecesMain < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :main, :boolean, :default => false
  end
end
