require "test_helper"

class CalendarHelperTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "generate a class" do
    course = courses(:one)
    all_params = CalendarHelper.generate_class_period(course.repetition_frequency, course.name,
                                                    course.id,
                                                    course.start_date, course.end_date,
                                                    course.start_time, course.end_time, course.calendar_id)
    correct_params = [
        {name: "COSCI_CLASS", course_id: 1, start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), date: Date.new(2022, 10, 03)},
        {name: "COSCI_CLASS", course_id: 1, start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), date: Date.new(2022, 10, 10)},
        {name: "COSCI_CLASS", course_id: 1, start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), date: Date.new(2022, 10, 05)},
        {name: "COSCI_CLASS", course_id: 1, start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), date: Date.new(2022, 10, 06)}
    ]
    for i in 0...4 do
        #assert_equal(all_params[i][:name], correct_params[i][:name])
        #assert_equal(all_params[i][:start_time], correct_params[i][:start_time])
        #assert_equal(all_params[i][:end_time], correct_params[i][:end_time])
        #assert_equal(all_params[i][:date], correct_params[i][:date])
    end
  end 
end