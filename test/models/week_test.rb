require "test_helper"

class WeekTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "load normal week" do
    date = Date.new(2022, 10, 16)
    week = Week.new(date)
    list_of_days = week.load_week
    day_num = date.day
    list_of_days.each do |day|
        assert_equal(day.currentDate, "10/#{day_num}/2022")
        day_num += 1
    end
  end

  test "next has single digit m or d" do
    date = Week.new(Date.new(2022, 8, 01))
    assert_equal(date.next, "08072022")
  end

  test "next has double digits" do
    date = Week.new(Date.new(2022, 8, 14))
    assert_equal(date.next, "08212022")
  end

  test "next is new month" do
    date = Week.new(Date.new(2022, 8, 28))
    assert_equal(date.next, "09012022")
  end

  test "next is new year" do
    date = Week.new(Date.new(2022, 12, 25))
    assert_equal(date.next, "01012023")
  end

  test "prev has single digit m or d" do
    date = Week.new(Date.new(2022, 8, 07))
    assert_equal(date.prev, "08012022")
  end

  test "prev has double digits" do
    date = Week.new(Date.new(2022, 8, 21))
    assert_equal(date.prev, "08142022")
  end

  test "prev is prev month" do
    date = Week.new(Date.new(2022, 12, 1))
    assert_equal(date.prev, "11272022")
  end

  test "prev is prev year" do
    date = Week.new(Date.new(2022, 01, 01))
    assert_equal(date.prev, "12262021")
  end

  test "length of week" do
    date = Date.new(2022, 11, 01);
    week = Week.new(date)
    assert_equal(week.getLengthOfWeek(date), 5)

    date = Date.new(2022, 11, 6);
    week = Week.new(date)
    assert_equal(week.getLengthOfWeek(date), 7)

    date = Date.new(2022, 11, 27);
    week = Week.new(date)
    assert_equal(week.getLengthOfWeek(date), 4)
  end

  test "current date" do
    date = Week.new(Date.new(2022, 12, 1))
    assert_equal(date.current, "12012022")

    date = Week.new(Date.new(2022, 8, 01))
    assert_equal(date.current, "08012022")

    date = Week.new(Date.new(2022, 8, 14))
    assert_equal(date.current, "08142022")
  end
end