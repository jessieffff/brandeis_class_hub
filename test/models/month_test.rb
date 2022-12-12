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
    weeks = m.load_month(users(:one).id)
    assert_equal(weeks[0].days_in_week, 1)
    assert_equal(weeks[1].days_in_week, 7)
    assert_equal(weeks[2].days_in_week, 7)
    assert_equal(weeks[3].days_in_week, 7)
    assert_equal(weeks[4].days_in_week, 7)
    assert_equal(weeks[5].days_in_week, 2)
  end
  
  test "loading month ending on Sat" do
    m = Month.new(12, 2022)
    weeks = m.load_month(users(:one).id)
    assert_equal(weeks[0].days_in_week, 3)
    assert_equal(weeks[1].days_in_week, 7)
    assert_equal(weeks[2].days_in_week, 7)
    assert_equal(weeks[3].days_in_week, 7)
    assert_equal(weeks[4].days_in_week, 7)
    assert_nil(weeks[5])
  end

  test "get month and year" do
    m = Month.new(10, 2022)
    assert_equal(m.get_month_year, "October 2022")

    m = Month.new(5, 2022)
    assert_equal(m.get_month_year, "May 2022")
  end

  test "next" do
    m = Month.new(10, 2022)
    assert_equal(m.next, "2022-11-01")

    m = Month.new(06, 2022)
    assert_equal(m.next, "2022-07-01")    
  end

  test "previous" do
    m = Month.new(1, 2022)
    assert_equal(m.prev, "2021-12-01")

    m = Month.new(5, 2022)
    assert_equal(m.prev, "2022-04-01")
  end

  test "current" do
    m = Month.new(1, 2022)
    assert_equal(m.current, "2022-01-01")

    m = Month.new(10, 2022)
    assert_equal(m.current, "2022-10-01")
  end

end