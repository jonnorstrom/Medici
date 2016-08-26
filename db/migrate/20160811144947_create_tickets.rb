class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :museum_id
      t.integer :user_id
      t.float :unit_price
      t.integer :quantity
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
