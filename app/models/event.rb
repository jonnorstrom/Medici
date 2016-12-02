class Event < ApplicationRecord
  belongs_to :museum, :required => false
  has_many :taggings
  has_many :tickets
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, :allow_destroy => true
  validate :end_must_be_after_start
  validate :close_must_be_after_open

  has_attached_file :photo, styles: { large: "768x768>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates_presence_of :name, :start_date, :end_date, :opening_time, :closing_time, :blurb, :description, :photo, :price, :website, :address
  validates_uniqueness_of :name
  validate :image_dimensions

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def to_param
    "#{id} #{name}".parameterize
  end

  def self.find_events_with_tickets
    Event.all.map { |ev| ev if ev.tickets.count > 0 }.compact!
  end

  def paid_tickets
    tickets.select { |t| t.paid == true }
  end

  def sorted_tickets(parameter = nil, direction = nil)
    case parameter
    when "Quantity"
      return tickets.to_a.sort! {|x, y| y.quantity <=> x.quantity}
    when "Name"
      return tickets.to_a.sort! {|x, y| x.user.name <=> y.user.name}
    else
      return tickets.to_a.sort! {|x, y| y.updated_at <=> x.updated_at}
    end
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
    def end_must_be_after_start
      if start_date == nil || end_date == nil
        errors.add(:closing_time, "must be after start date")
      elsif start_date > end_date
        errors.add(:end_date, "must be after start date")
      end
    end

    def close_must_be_after_open
      if opening_time == nil || closing_time == nil
        errors.add(:closing_time, "must be after start date")
      elsif opening_time >= closing_time
        errors.add(:closing_time, "must be after start date")
      end
    end
end
