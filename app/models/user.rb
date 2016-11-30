class User < ApplicationRecord
  has_many :tickets
  has_many :identities
  has_many :taggings, :inverse_of => :user
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, :allow_destroy => true

  has_attached_file :avatar, styles: { large: "768x768>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :email, :password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]
  after_create :send_admin_mail

  def send_admin_mail
     UsersMailer.signup_email(self).deliver
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def name
    return full_name if full_name.length > 0

    set_full_name
    get_full_name
  end

  def get_full_name
    "#{first_name} #{last_name}"
  end

  def set_full_name
    self.update_columns(full_name: get_full_name)
  end
end
