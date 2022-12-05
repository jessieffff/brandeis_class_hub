class User < ApplicationRecord
  before_save { email.downcase! }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :user_calendars, dependent: :destroy
  has_many :calendars, through: :user_calendars

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost:)
  end

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_create do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password_digest = access_token.credentials.token
    end

  end
end
