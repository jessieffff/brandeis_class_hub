require "test_helper"

class HolidayTest < ActiveSupport::TestCase
  def setup
    @holiday = Holiday.new(calendar_id: Calendar.first.id, name: "example",
                             date: Date.new(2022, 11, 21),
                             holiday_type: "Brandeis")
  end

  test "should be valid" do
    assert @holiday.valid?
  end

  test "name should be present" do
    @holiday.name = ""
    assert_not @holiday.valid?
  end

  test "name should not be too long" do
    @holiday.name = "a" * 255 + "example.com"
    assert_not @holiday.valid?
  end

  test "name should be unigue" do
    @holiday.name = "Christmas"
    assert_not @holiday.valid?
  end

  test "calendar_id must be present" do
    @holiday.calendar_id = "     "
    assert_not @holiday.valid?
  end

  test "date must be present" do
    @holiday.date = "      "
    assert_not @holiday.valid?
  end

  test "holiday type must be present" do
    @holiday.holiday_type = "      "
    assert_not @holiday.valid?
  end


end
