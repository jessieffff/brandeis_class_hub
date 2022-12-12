class UserCalendar < ApplicationRecord
  validates :calendar_id, presence: true
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :calendar
end
