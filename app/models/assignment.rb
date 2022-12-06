class Assignment < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  
  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' # name of column containing FK
  )
end
