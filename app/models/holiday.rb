require 'time'
require 'active_support'
require 'friendly_id'
class Holiday < ApplicationRecord
  extend FriendlyId
  validates :calendar_id, presence: true
  validates :date, presence: true
  validates :holiday_type, presence: true
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  
  friendly_id :name, use: :slugged

  belongs_to(
    :calendar,
    foreign_key: 'calendar_id'
  )
end
