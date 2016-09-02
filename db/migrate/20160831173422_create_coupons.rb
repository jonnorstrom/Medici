class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :discount_percent
      t.timestamp :expires_at
      t.string :description
      t.integer :quantity_redeemed, default: 0
      t.timestamps
    end
  end
end
