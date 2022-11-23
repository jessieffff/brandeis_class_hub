require 'time'
require 'active_support'
class Course < ApplicationRecord
  belongs_to(
    :calendar,
    foreign_key: 'calendar_id' # name of column containing FK
  )
  has_many(
    :class_periods,
    foreign_key: 'course_id' # name of column containing FK in other table
  )

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      course_hash = Course.new
      course_hash.calendar_id = row[1]
      course_hash.name = row[0]
      puts "111"
      puts row[9]
      course_hash.start_date = self.date_convertor(row[9]).to_date
      course_hash.end_date = self.date_convertor(row[10]).to_date
      course_hash.location = row[4]
      course_hash.professor_name = row[8]
      course_hash.repetition_frequency = row[6]
      course_hash.save
    end
  end

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
