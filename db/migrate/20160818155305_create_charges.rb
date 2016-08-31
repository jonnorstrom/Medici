class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.integer :amount
      t.integer :coupon_id
      t.integer :stripe_id
      t.timestamps
    end
  end
end
