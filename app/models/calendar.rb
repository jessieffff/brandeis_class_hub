class Calendar < ApplicationRecord
  has_many :user_calendars
  has_many :users, through: :user_calendars, source: :user
end
