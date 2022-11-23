require "test_helper"

class DayTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "current day" do
    day = Day.new(2022, 10, 18)
    assert_equal(day.currentDate, "2022/10/18")
  end

  test "param day" do
    day = Day.new(2022, 10, 18)
    assert_equal(day.params_date, "2022-10-18")
  end

  test "display date" do
    day = Day.new(2022, 10, 18)
    assert_equal(day.display_date, "Tuesday October 18")
  end

  test "day_of_week" do
    day = Day.new(2022, 10, 18)
    assert_equal(day.day_of_week, "Tuesday")
  end

  test "load_events" do
    datetime = Date.new(2022, 10, 18)
    day = Day.new(2022, 10, 18)
    user = User.create(first_name: "David", last_name: "Shapiro", student_id: 5, email: "fake@gmail.com")
    cal = Calendar.create(user_id: 980190963, calendar_name: "Test Cal", shared: true)
    a = OtherEvent.create!(calendar_id: cal.id, name: "Test 1", start_time: datetime, end_time: datetime)
    b = OtherEvent.create(calendar_id: cal.id, name: "Test 2", start_time: datetime, end_time: datetime)
    real_events = [a, b]
    today_events = day.load_events
    assert_equal(real_events, today_events)
  end

  test "next is low digit" do
    day = Day.new(2022, 8, 6)
    assert_equal(day.next, "2022-08-07")
  end

  test "next is double digit" do
    day = Day.new(2022, 8, 9)
    assert_equal(day.next, "2022-08-10")
  end

  test "next is new month" do
    day = Day.new(2022, 10, 31)
    assert_equal(day.next, "2022-11-01")
  end

  test "next is new year" do
    day = Day.new(2022, 12, 31)
    assert_equal(day.next, "2023-01-01")
  end

  test "prev is low digit" do
    day = Day.new(2022, 8, 6)
    assert_equal(day.prev, "2022-08-05")
  end

  test "prev is double digit" do
    day = Day.new(2022, 8, 12)
    assert_equal(day.prev, "2022-08-11")
  end

  test "prev is prev month" do
    day = Day.new(2022, 11, 1)
    assert_equal(day.prev, "2022-10-31")
  end

  test "prev is last year" do
    day = Day.new(2023, 1, 1)
    assert_equal(day.prev, "2022-12-31")
  end



end