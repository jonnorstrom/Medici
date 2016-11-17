class Order < ApplicationRecord
  has_many :tickets
  before_save :update_subtotal

  def subtotal
    tickets.collect {|ticket| ticket.valid? ? (p ticket.total_price) : 0}.sum
  end

  def includes_event_post?(id)
    found = false
    tickets.each { |t| t.event_id == id ? found = true : nil }
    return found
  end

  def clear_cart
    self.tickets.destroy_all
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
