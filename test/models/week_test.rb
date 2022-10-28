require "test_helper"

class WeekTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "load normal week" do
    date = Date.new(2022, 10, 16)
    week = Week.new(date, 7)
    list_of_days = week.load_week
    day_num = date.day
    list_of_days.each do |day|
        assert_equal(day.currentDate, "10/#{day_num}/2022")
        day_num += 1
    end
  end
end