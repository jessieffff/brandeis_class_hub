require "test_helper"

class ClassPeriodTest < ActiveSupport::TestCase
  def setup
    @class_period = ClassPeriod.new(calendar_id: Calendar.first.id, course_id: Course.first.id, name: "example",
                                 start_time: Time.zone.local(2000, 1, 1, 10, 0, 0),
                                 end_time: Time.zone.local(2000, 1, 1, 12, 0, 0),
                                 date: Date.new(2022, 10, 27))
  end

  test "should be valid" do
    assert @class_period.valid?
  end

  test "name should be present" do
    @class_period.name = ""
    assert_not @class_period.valid?
  end

  test "calendar_id must be present" do
    @class_period.calendar_id = "     "
    assert_not @class_period.valid?
  end

  test "course_id must be present" do
    @class_period.course_id =  "      "
    assert_not @class_period.valid?
  end

  test "date must be present" do
    @class_period.date = "      "
    assert_not @class_period.valid?
  end

  test "start time must be present" do
    @class_period.start_time = "      "
    assert_not @class_period.valid?
  end

  test "endtime must be present" do
    @class_period.end_time = "      "
    assert_not @class_period.valid?
  end

end