require 'time'
require 'active_support'
class Course < ApplicationRecord
  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' # name of column containing FK
  )
  has_many(
    :class_periods,
    foreign_key: 'course_id', # name of column containing FK in other table
    dependent: :destroy_async
  )

  def self.date_convertor(date_string)
    date = ""
    if date_string[1] == '/' && date_string[3] == "/"
      date <<  date_string[2]
      date <<  "/"
      date <<  date_string[0]
      date <<  "/"
      date <<  date_string[4..5]
    elsif date_string[1] == "/" && date_string[4] == "/"
       date <<  date_string[2..3]
       date <<  "/"
       date <<  date_string[0]
       date <<  "/"
       date <<  date_string[5..6]
    elsif date_string[2] == "/" && date_string[4] == "/"
      date <<  date_string[3]
      date <<  "/"
      date <<  date_string[0..1]
      date <<  "/"
      date <<  date_string[5..6]
    elsif date_string[2] == "/" && date_string[5] == "/"
      date <<  date_string[3..4]
      date <<  "/"
      date <<  date_string[0..1]
      date <<  "/"
      date <<  date_string[6..7]
    end
  end
end
