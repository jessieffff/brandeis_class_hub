class OtherEvent < ApplicationRecord
  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' # name of column containing FK
  )
end
