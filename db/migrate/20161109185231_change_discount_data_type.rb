class ChangeDiscountDataType < ActiveRecord::Migration[5.0]
  def change
    change_column(:coupons, :discount_percent, :float)
  end
end
