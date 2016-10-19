class AddTicketableToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :ticketable, :boolean
  end
end
