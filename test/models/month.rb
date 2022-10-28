require "test_helper"

class MonthTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "making a date" do
    m = Month.new(10, 2022)
    actual_date = Date.new(2022, 10, 18);
    assert_equal(actual_date, m.make_date(18))
  end

  test "loading month" do
    m = Month.new(10, 2022)
    weeks = m.load_month
    assert_equal(weeks[0].days_in_week, 1)
    assert_equal(weeks[1].days_in_week, 7)
    assert_equal(weeks[2].days_in_week, 7)
    assert_equal(weeks[3].days_in_week, 7)
    assert_equal(weeks[4].days_in_week, 7)
    assert_equal(weeks[5].days_in_week, 2)
  end

end