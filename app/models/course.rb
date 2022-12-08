require 'time'
require 'active_support'
require 'friendly_id'
class Course < ApplicationRecord
  extend FriendlyId
  validates :calendar_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :professor_name, presence: true
  validates :repetition_frequency, presence: true
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  friendly_id :name, use: :slugged
  
  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' # name of column containing FK
  )
  has_many(
    :class_periods,
    foreign_key: 'course_id', # name of column containing FK in other table
    dependent: :destroy_async
  )

  has_many(
    :assignments,
    foreign_key: 'course_id', # name of column containing FK in other table
    dependent: :destroy_async
  )
end
