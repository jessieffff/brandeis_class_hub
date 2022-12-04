require 'time'
require 'active_support'
class Course < ApplicationRecord
  validates :calendar_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :professor_name, presence: true
  validates :repetition_frequency, presence: true

  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' # name of column containing FK
  )
  has_many(
    :class_periods,
    foreign_key: 'course_id', # name of column containing FK in other table
    dependent: :destroy_async
  )
end
