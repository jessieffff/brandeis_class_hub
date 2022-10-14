class Assignment < ApplicationRecord
  belongs_to(
    :event, 
    foreign_key: 'event_id' # name of column containing FK
  )
end
