class User < ApplicationRecord
  has_many :tickets
  has_many :taggings, :inverse_of => :user
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, :allow_destroy => true

  has_attached_file :avatar, styles: { large: "768x768>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name, :email, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

end
