require 'faker'

10.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name, student_id: Faker::Number.number(digits: 9), email: Faker::Internet.email)
end
for i in 1..10 do
  Calendar.create(calendar_name: Faker::Lorem.word,
        user_id: i, shared: Faker::Boolean.boolean)
  Assignment.create(calendar_id: i, name: "Assignment #{Faker::Lorem.word}",
                    due_date: Faker::Time.forward(days: 7, period: :evening), course_id: Faker::Number.number(digits: 1))
  Course.create(calendar_id: i, name: Faker::Lorem.word,
                    start_date: Faker::Date.in_date_period(year: 2022, month: 9), end_date: Faker::Date.in_date_period(year: 2022, month: 12), location: Faker::Address.full_address, professor_first_name: Faker::Name.first_name, professor_last_name: Faker::Name.last_name, repetition_frequency: Faker::Types.character, url: Faker::Internet.url)
  ClassPeriod.create(course_id: i, name: "Class #{Faker::Lorem.word}",
                     start_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100), end_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100))
  Holiday.create(calendar_id: i, name: "Holiday #{Faker::Lorem.word}",
                 date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 365), holiday_type: Faker::Lorem.word)
  UserCalendar.create(user_id: i, calendar_id: i)
  OtherEvent.create(calendar_id: i, name: "Event #{Faker::Lorem.word}",
                    start_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100), end_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100))
end

u = User.create(first_name: "David", last_name: "Shapiro", student_id: 54631, email: "david.shapiro@gmail.com")
c = Calendar.create(calendar_name: "David Calendar", user_id: u.id, shared: false)
OtherEvent.create(calendar_id: c.id, name: "David Birthday",
                    start_time: Date.new(2022, 10, 27), end_time: Date.new(2022, 10, 28))
10.times do |i|
  start_day = rand(27) + 1
  OtherEvent.create(calendar_id: c.id, name: "Event #{Faker::Lorem.word}",
                    start_time: Date.new(2022, 10, start_day), end_time: Date.new(2022, 10, start_day + 1))
end