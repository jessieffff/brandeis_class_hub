class OtherEvent < ApplicationRecord
  extend FriendlyId

  validates :calendar_id, presence: true
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true, comparison: { greater_than: :start_time, message: "must be after Start time" }
  friendly_id :name, use: :slugged


  belongs_to(
    :calendar,
    foreign_key: 'calendar_id'
  )
end
