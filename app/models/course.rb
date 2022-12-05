require 'time'
require 'active_support'
require 'friendly_id'
class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true

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
