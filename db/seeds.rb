# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name, student_id: Faker::Number.number(digits: 9), email: Faker::Internet.email)
  Assignment.create(calendar_id: Faker::Number.number(digits: 1), assignment_name: Faker::Lorem.word,
                    due_date: Faker::Time.forward(days: 7, period: :evening), course_id: Faker::Number.number(digits: 1))
  Calendar.create(calendar_name: Faker::Lorem.word,
                  user_id: Faker::Number.number(digits: 1), shared: Faker::Boolean.boolean, invite_token: Faker::Code.imei)
  ClassPeriod.create(course_id: Faker::Number.number(digits: 1),
                     start_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100), end_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100))
  Course.create(calendar_id: Faker::Number.number(digits: 1), course_name: Faker::Lorem.word,
                start_date: Faker::Date.in_date_period(year: 2022, month: 9), end_date: Faker::Date.in_date_period(year: 2022, month: 12), location: Faker::Address.full_address, professor_first_name: Faker::Name.first_name, professor_last_name: Faker::Name.last_name, repetition_frequency: Faker::Types.character, url: Faker::Internet.url)
  Holiday.create(calendar_id: Faker::Number.number(digits: 1), holiday_name: Faker::Lorem.word,
                 date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 365), holiday_type: Faker::Lorem.word)
  UserCalendar.create(user_id: Faker::Number.number(digits: 1), calendar_id: Faker::Number.number(digits: 1))
  OtherEvent.create(calendar_id: Faker::Number.number(digits: 1), other_name: Faker::Lorem.word,
                    start_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100), end_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100))
end

# 10.times do
#   User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
#               student_id: Faker::Number.number(digits: 9), email: Faker::Internet.email)
#   Calendar.create(calendar_name: Faker::Name.name, shared: Faker::Boolean.boolean)
# end

# 10.times do
#   UserCalendar.create(user: User.all.sample, calendar: Calendar.all.sample)
# end
