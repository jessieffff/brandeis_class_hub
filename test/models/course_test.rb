require "test_helper"

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(calendar_id: Calendar.first.id, name: "example",
                             start_date: Date.new(2022, 11, 21), end_date: Date.new(2022, 12, 21),
                             start_time: Time.zone.local(2000, 1, 1, 10, 0, 0),
                             end_time: Time.zone.local(2000, 1, 1, 12, 0, 0),
                             professor_name: "Pito", repetition_frequency: "MW")
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "name should be present" do
    @course.name = ""
    assert_not @course.valid?
  end

  test "name should not be too long" do
    @course.name = "a" * 255 + "example.com"
    assert_not @course.valid?
  end

  test "name should be unigue" do
    @course.name = "COSCI_CLASS"
    assert_not @course.valid?
  end

  test "calendar_id must be present" do
    @course.calendar_id = "     "
    assert_not @course.valid?
  end

  test "start date must be present" do
    @course.start_date = "      "
    assert_not @course.valid?
  end

  test "end date must be present" do
    @course.end_date = "      "
    assert_not @course.valid?
  end

  test "end date must be after start date" do
    @course.end_date = Date.new(2022, 10, 25)
    @course.start_date = Date.new(2022, 11, 25)
    assert_not @course.valid?
  end

  test "start time must be present" do
    @course.start_time = "      "
    assert_not @course.valid?
  end

  test "end time must be present" do
    @course.end_time = "      "
    assert_not @course.valid?
  end

  test "end time must be after start" do
    @course.end_time = Time.zone.local(2000, 1, 1, 10, 0, 0)
    @course.start_time = Time.zone.local(2000, 1, 1, 12, 0, 0)
    assert_not @course.valid?
  end

  test "professor name must be present" do
    @course.professor_name = "      "
    assert_not @course.valid?
  end

  test "repetition freq must be present" do
    @course.repetition_frequency = "      "
    assert_not @course.valid?
  end

end
