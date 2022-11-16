require 'active_support/core_ext/string'
require 'date'
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
    CSV.foreach(file.path, headers:true) do |row|
      course_hash = Course.new
      # how should we get the calendar id?
      course_hash.calendar_id = row[2]
      course_hash.name = row[1]
      # # data type is not right
      # original_date = row[9]
      # date = ""
      # if original_date[1] == "/" and original_date[3] == "/"
      #   date += original_date[2]
      #   date += "/"
      #   date += original_date[0]
      #   date += "/"
      #   date += original_date[4..5]
      # elif original_date[2] == "/" and original_date[4] == "/"
      #   date += original_date[3]
      #   date += "/"
      #   date += original_date[0..1]
      #   date += "/"
      #   date += original_date[5..6]
      # elif original_date[2] == "/" and original_date[5] == "/"
      #   date += original_date[3,4]
      #   date += "/"
      #   date += original_date[0..1]
      #   date += "/"
      #   date += original_date[6..7]
      # end
      # puts "111"
      # puts date
      # course_hash.start_date = date.to_date
      course_hash.end_date = row[10]
      course_hash.location = row[4]
      # maybe we should change to professor name
      course_hash.professor_first_name = row[8]
      course_hash.professor_last_name = row[8]
      # how to decompose the frequency
      course_hash.repetition_frequency = row[7]
      # what's this for
      course_hash.url = row[8]
      puts "111"
      puts course_hash
      course_hash.save
    end
  end
end
