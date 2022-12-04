class OtherEvent < ApplicationRecord

  validates :calendar_id, presence: true
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :date, presence: true

  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' # name of column containing FK
  )
end
