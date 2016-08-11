class Museum < ApplicationRecord
  has_many :tickets
  has_many :exhibits

end
