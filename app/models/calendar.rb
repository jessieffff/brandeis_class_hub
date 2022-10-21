class Calendar < ApplicationRecord
  has_many :user_calendars
  has_many :users, through: :user_calendars, source: :user
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
end
