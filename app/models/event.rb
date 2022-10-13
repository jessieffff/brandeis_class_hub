class Event < ApplicationRecord
  has_many(
    :holidays, 
    foreign_key: 'event_id' # name of column containing FK in other table
  )
  has_many(
    :assignments, 
    foreign_key: 'event_id' # name of column containing FK in other table
  )
  has_many(
    :courses, 
    foreign_key: 'event_id' # name of column containing FK in other table
  )
end
