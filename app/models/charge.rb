class Charge < ApplicationRecord
  belongs_to :coupon
  validates_presence_of :amount, :stripe_id
end
