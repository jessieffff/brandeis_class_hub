class Assignment < ApplicationRecord
  extend FriendlyId
  validates :calendar_id, presence: true
  validates :due_date, presence: true
  validates :due_time, presence: true
  validates :course_id, presence: true
  friendly_id :name, use: :slugged
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  
  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' # name of column containing FK
  )
end
