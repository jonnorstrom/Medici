class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :museum_id
      t.integer :user_id
      t.float :unit_price
      # t.float :child_price
      # t.float :senior_price
      # t.integer :child_quantity
      # t.integer :senior_quantity
      t.integer :quantity
      t.string :redemption_code
      # t.integer :original_child_quantity
      # t.integer :original_senior_quantity
      t.integer :original_quantity
      t.integer :order_id
      t.float :total_price
      t.boolean :paid, default: false
      t.boolean :redeemed, default: false
      t.date :date_redeemed
      t.timestamps
    end
  end
end
