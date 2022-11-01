class User < ApplicationRecord
  # devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :user_calendars
  has_many :calendars, through: :user_calendars, source: :calendar
end
