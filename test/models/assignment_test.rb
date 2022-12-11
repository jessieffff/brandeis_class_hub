require "test_helper"

class AssignmentTest < ActiveSupport::TestCase
  def setup
    @assignment = Assignment.new(calendar_id: Calendar.first.id, course_id: Course.first.id, name: "example",
                                 due_date: Date.new(2022, 12, 21), due_time: Time.zone.local(2000, 1, 1, 10, 0, 0))
  end

  test "should be valid" do
    assert @assignment.valid?
  end

  test "name should be present" do
    @assignment.name = ""
    assert_not @assignment.valid?
  end

  test "name should not be too long" do
    @assignment.name = "a" * 255 + "example.com"
    assert_not @assignment.valid?
  end

  test "name should be unigue" do
    @assignment.name = "Test_Assignment"
    assert_not @assignment.valid?
  end

  test "calendar_id must be present" do
    @assignment.calendar_id = "     "
    assert_not @assignment.valid?
  end

  test "course_id must be present" do
    @assignment.course_id =  "      "
    assert_not @assignment.valid?
  end

  test "date must be present" do
    @assignment.due_date = "      "
    assert_not @assignment.valid?
  end

  test "time must be present" do
    @assignment.due_time = "      "
    assert_not @assignment.valid?
  end
end
