class ClassPeriod < ApplicationRecord
  validates :calendar_id, presence: true
  validates :name, presence: true
  validates :course_id, presence: true
  validates :start_time, presence: true
  validates :date, presence: true
  validates :end_time, presence: true, comparison: { greater_than: :start_time, message: "must be after Start time" }
  belongs_to(
    :course,
    foreign_key: 'course_id' # name of column containing FK
  )
end
