class Exhibit < ApplicationRecord
  belongs_to :museum
  has_many :taggings
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, :allow_destroy => true
end
