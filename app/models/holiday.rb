class Holiday < ApplicationRecord
  extend FriendlyId
  validates :calendar_id, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :holiday_type, presence: true
  
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :date, presence: true

  belongs_to(
    :calendar,
    foreign_key: 'calendar_id'
  )
end
