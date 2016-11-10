class AddActiveToCoupon < ActiveRecord::Migration[5.0]
  def change
    add_column :coupons, :active, :boolean, :default => true
  end
end
