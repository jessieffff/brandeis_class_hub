class Calendar < ApplicationRecord
  has_secure_token :invite_token
  has_many :user_calendars
  has_many :users, through: :user_calendars
  has_many(
    :holidays,
    foreign_key: 'calendar_id' # name of column containing FK in other table
  )
  has_many(
    :assignments,
    foreign_key: 'calendar_id' # name of column containing FK in other table
  )
  has_many(
    :courses,
    foreign_key: 'calendar_id' # name of column containing FK in other table
  )
  has_many(
    :other_events,
    foreign_key: 'calendar_id' # name of column containing FK in other table
  )

  def to_param
    invite_token
  end

  def user?(user)
    users.include?(user)
  end
end
