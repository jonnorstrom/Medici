class AddTicketIdtoCoupon < ActiveRecord::Migration[5.0]
  def change
    add_column :coupons, :ticket_id, :integer
  end
end
