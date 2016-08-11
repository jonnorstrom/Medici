class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.float :price
      t.integer :museum_id
      t.integer :user_id
      t.boolean :paid
      t.boolean :redeemed
      t.date :date_redeemed
      t.timestamps
    end
  end
end
