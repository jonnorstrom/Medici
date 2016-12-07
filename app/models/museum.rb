class Museum < ApplicationRecord
  has_many :tickets
  has_many :taggings
  has_many :tags, through: :taggings
  default_scope { where(active: true) }
  accepts_nested_attributes_for :taggings, :allow_destroy => true
  has_many :exhibits
  has_many :events
  has_many :pieces

  has_attached_file :photo, styles: { large: "768x768>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name, :blurb, :description, :photo, :price, :address, :opening_time, :closing_time, :website
  validates_uniqueness_of :name
  validate :close_must_be_after_open
  validate :image_dimensions

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def to_param
    "#{id} #{name}".parameterize
  end

  def get_todays_hours
    case Time.now.strftime("%A") ##today
    when "Monday"
      todays_hours = "#{mon_open.strftime("%I:%M%p")} - #{mon_close.strftime("%I:%M%p")}"
    when "Tuesday"
      todays_hours = "#{tue_open.strftime("%I:%M%p")} - #{tue_close.strftime("%I:%M%p")}"
    when "Wednesday"
      todays_hours = "#{wed_open.strftime("%I:%M%p")} - #{wed_close.strftime("%I:%M%p")}"
    when "Thursday"
      todays_hours = "#{thu_open.strftime("%I:%M%p")} - #{thu_close.strftime("%I:%M%p")}"
    when "Friday"
      todays_hours = "#{fri_open.strftime("%I:%M%p")} - #{fri_close.strftime("%I:%M%p")}"
    when "Saturday"
      todays_hours = "#{sat_open.strftime("%I:%M%p")} - #{sat_close.strftime("%I:%M%p")}"
    when "Sunday"
      todays_hours = "#{sun_open.strftime("%I:%M%p")} - #{sun_close.strftime("%I:%M%p")}"
    end
    if todays_hours == "12:00AM - 012:00AM"
      todays_hours = "Closed today"
    end
    return todays_hours
  end

   private

  def image_dimensions
    if photo.queued_for_write[:original] != nil
      required_width  = 400
      required_height = 400
      dimensions = Paperclip::Geometry.from_file(photo.queued_for_write[:original].path)

      errors.add(:photo, "Width must be 400px") unless dimensions.width >= required_width
      errors.add(:photo, "Height must be 400px") unless dimensions.height >= required_height
    end
  end

  def close_must_be_after_open
    if opening_time == nil || closing_time == nil
      errors.add(:closing_time, "must be after opening_time")
    elsif opening_time > closing_time
      errors.add(:closing_time, "must be after opening_time")
    end
  end

end
