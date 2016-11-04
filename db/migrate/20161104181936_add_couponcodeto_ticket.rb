class AddCouponcodetoTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :coupon_code, :string
  end
end
