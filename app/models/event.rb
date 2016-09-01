class Event < ApplicationRecord
  belongs_to :museum
  has_many :taggings
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, :allow_destroy => true

  has_attached_file :photo, styles: { large: "768x768>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
