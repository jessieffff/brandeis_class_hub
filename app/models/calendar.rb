class Calendar < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true

  has_secure_token :invite_token
  has_many :user_calendars, dependent: :destroy
  has_many :users, through: :user_calendars
  has_many(
    :holidays,
    foreign_key: 'calendar_id',
    dependent: :destroy_async
  )
  has_many(
    :assignments,
    foreign_key: 'calendar_id',
    dependent: :destroy_async
  )
  has_many(
    :courses,
    foreign_key: 'calendar_id',
    dependent: :destroy_async
  )
  has_many(
    :other_events,
    foreign_key: 'calendar_id',
    dependent: :destroy_async
  )
 

  def to_param
    invite_token
  end

  def user?(user)
    users.include?(user)
  end
end
