class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  before_save { email.downcase! }
  validates :full_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :user_calendars, dependent: :destroy
  has_many :calendars, through: :user_calendars

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.email = auth.info.email
    unless user.password.present?
      user.password = Devise.friendly_token[0, 20]
    end
    user.full_name = auth.info.name
    user.avatar_url = auth.info.image

    user.save
    user
  end
end
