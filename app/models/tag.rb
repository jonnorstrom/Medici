class Tag < ApplicationRecord
  has_many :taggings, :inverse_of => :tag
  has_many :museums, through: :taggings
  has_many :exhibits, through: :taggings
  has_many :users, through: :taggings
  has_many :pieces, through: :taggings
  has_many :events, through: :taggings


end
