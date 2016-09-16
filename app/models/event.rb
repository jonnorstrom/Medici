class Event < ApplicationRecord
  belongs_to :museum
  has_many :taggings
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, :allow_destroy => true
  validate :end_must_be_after_start

  has_attached_file :photo, styles: { large: "768x768>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates_presence_of :name, :start_date, :end_date, :blurb, :description, :photo
  validates_uniqueness_of :name

  private
    def end_must_be_after_start
      if start_date >= end_date
        errors.add(:end_date, "must be after start date")
      end
    end
end
