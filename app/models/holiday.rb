class Holiday < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' 
  )
end
