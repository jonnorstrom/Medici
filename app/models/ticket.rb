class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :museum
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # validate :museum_present
  # validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      museum.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def museum_present
    if museum.nil?
      errors.add(:museum, "is not a valid museum")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
