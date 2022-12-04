class Assignment < ApplicationRecord
  validates :calendar_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :due_date, presence: true
  validates :due_time, presence: true
  validates :course_id, presence: true
  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' # name of column containing FK
  )
end
