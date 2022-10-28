require "test_helper"

class DayTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "current day" do
    day = Day.new(2022, 10, 18)
    assert_equal(day.currentDate, "10/18/2022");
  end

  test "load_events" do
    datetime = Date.new(2022, 10, 18)
    day = Day.new(2022, 10, 18)
    user = User.create(first_name: "David", last_name: "Shapiro", student_id: 5, email: "fake@gmail.com")
    cal = Calendar.create(user_id: 980190963, calendar_name: "Test Cal", shared: true)
    a = OtherEvent.create!(calendar_id: cal.id, other_name: "Test 1", start_time: datetime, end_time: datetime)
    b = OtherEvent.create(calendar_id: cal.id, other_name: "Test 2", start_time: datetime, end_time: datetime)
    real_events = [a, b]
    today_events = day.load_events
    assert_equal(real_events, today_events)
  end
end