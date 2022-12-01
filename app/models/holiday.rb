class Holiday < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :date, presence: true

  belongs_to(
    :calendar,
    foreign_key: 'calendar_id'
  )
end
