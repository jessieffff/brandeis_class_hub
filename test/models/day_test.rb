require "test_helper"

class DayTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "current day" do
    day = Day.new(2022, 10, 18, 1)
    assert_equal(day.currentDate, "2022/10/18")
  end

  test "param day" do
    day = Day.new(2022, 10, 18, 1)
    assert_equal(day.params_date, "2022-10-18")
  end

  test "display date" do
    day = Day.new(2022, 10, 18, 1)
    assert_equal(day.display_date, "Tuesday October 18")
  end

  test "day_of_week" do
    day = Day.new(2022, 10, 18, 1)
    assert_equal(day.day_of_week, "Tuesday")
  end

  test "load_events" do
    date = Date.new(1900, 11, 27)
    day = Day.new(1900, 11, 27, users(:one).id)
    
    real_events = [other_events(:test_2), other_events(:test_3)]
    today_events = day.load_events

    for i in 0...2 do
      assert_equal(real_events[i][:name], today_events[i][:name])
      assert_equal(real_events[i].start_time, today_events[i].start_time)
      assert_equal(real_events[i].end_time, today_events[i].end_time)
    end
  end

  test "next is low digit" do
    day = Day.new(2022, 8, 6, 1)
    assert_equal(day.next, "2022-08-07")
  end

  test "next is double digit" do
    day = Day.new(2022, 8, 9, 1)
    assert_equal(day.next, "2022-08-10")
  end

  test "next is new month" do
    day = Day.new(2022, 10, 31, 1)
    assert_equal(day.next, "2022-11-01")
  end

  test "next is new year" do
    day = Day.new(2022, 12, 31, 1)
    assert_equal(day.next, "2023-01-01")
  end

  test "prev is low digit" do
    day = Day.new(2022, 8, 6, 1)
    assert_equal(day.prev, "2022-08-05")
  end

  test "prev is double digit" do
    day = Day.new(2022, 8, 12, 1)
    assert_equal(day.prev, "2022-08-11")
  end

  test "prev is prev month" do
    day = Day.new(2022, 11, 1, 1)
    assert_equal(day.prev, "2022-10-31")
  end

  test "prev is last year" do
    day = Day.new(2023, 1, 1, 1)
    assert_equal(day.prev, "2022-12-31")
  end



end