class Order < ApplicationRecord
  has_many :tickets
  before_save :update_subtotal

  def subtotal
    tickets.collect {|ticket| ticket.valid? ? (ticket.total_price) : 0}.sum
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
