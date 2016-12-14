class AddMaxPrice < ActiveRecord::Migration[5.0]
  def change
    add_column(:events, :max_price, :float)
  end
end
