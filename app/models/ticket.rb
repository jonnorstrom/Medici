class Ticket < ApplicationRecord
  belongs_to :user, :required => false
  belongs_to :museum, :required => false
  belongs_to :event, :required => false
  belongs_to :exhibit, :required => false
  belongs_to :order, :required => false
  has_one :coupon, :required => false

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_save :finalize


  def unit_price
    if self.exhibit_id != nil
      exhibit.price
    elsif self.event_id != nil
      event.price
    else
      if persisted?
        self[:unit_price]
      else
        museum.price
      end
    end
  end

  # def total_price
  #   # if coupon_code == "hi"
  #
  # end

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
    if self[:coupon_code] == "MONASKEEZA"
       self[:total_price] = (quantity * self[:unit_price]) * 0.7
    elsif self[:coupon_code] == "WATCHMEWEIWEI"
       self[:total_price] = (quantity * self[:unit_price]) * 0.7
    elsif self[:coupon_code] == "MONET-NAY"
       self[:total_price] = (quantity * self[:unit_price]) * 0.7
    elsif self[:coupon_code] == "KLIMTAF"
       self[:total_price] = (quantity * self[:unit_price]) * 0.7
    elsif self[:coupon_code] == "VANGOGHBRO"
       self[:total_price] = (quantity * self[:unit_price]) * 0.7
    elsif self[:coupon_code] == "FRIENDSNFAM"
       self[:total_price] = 0.0
    elsif self[:coupon_code] == "HEYNEIGHBOR"
       self[:total_price] = 0.0
    elsif self[:coupon_code] == "TECHSQUAD"
       self[:total_price] = 0.0
    elsif self[:coupon_code] == "FRANDS"
       self[:total_price] = 0.0
    elsif self[:coupon_code] == "MUSEUMFOMO"
       self[:total_price] = 0.0
    elsif self[:coupon_code] == "INVISIBLEMUSEUM"
       self[:total_price] = 0.0
    end
  end
end
