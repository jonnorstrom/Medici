class Exhibit < ApplicationRecord
  belongs_to :museum
  has_many :taggings
  has_many :tickets
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, :allow_destroy => true

  has_attached_file :photo, styles: { large: "768x768>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates_presence_of :name, :blurb, :description, :photo
  validates_uniqueness_of :name
  validate :image_dimensions

  def to_param
    "#{id} #{name}".parameterize
  end

  def favorable_tags
    FavorableTag.where(exhibit_id: self.id)
  end

  def favorable_tags_as_tags
    favorable_tags.map { |t| Tag.find(t.tag_id) }
  end

  def has_perferred_tag?(tag)
    return favorable_tags_as_tags.include?(tag)
  end

  private

  def image_dimensions
    if photo.queued_for_write[:original] != nil
      required_width  = 400
      required_height = 298
      dimensions = Paperclip::Geometry.from_file(photo.queued_for_write[:original].path)

      errors.add(:photo, "Width must be 400px") unless dimensions.width >= required_width
      errors.add(:photo, "Height must be 298px") unless dimensions.height >= required_height
    end
  end
end
