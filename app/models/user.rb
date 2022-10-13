class User < ApplicationRecord
  has_many :user_calendars
  has_many :calendars, through: :user_calendars, source: :calendar
end
