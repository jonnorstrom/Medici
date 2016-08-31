class User < ApplicationRecord
  has_many :tickets
  has_many :taggings, :inverse_of => :user
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, :allow_destroy => true


  has_attached_file :avatar, styles: {large:"500x500>", medium: "300x300>", small: "200x200>", thumb: "100x100>" }, default_url: "default-profile.jpg"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
