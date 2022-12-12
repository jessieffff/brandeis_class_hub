require "test_helper"

class OtherEventTest < ActiveSupport::TestCase
  def setup
    @other_event = OtherEvent.new(calendar_id: Calendar.first.id, name: "example",
                             date: Date.new(2022, 11, 21),
                             start_time: Time.zone.local(2000, 1, 1, 10, 0, 0),
                             end_time: Time.zone.local(2000, 1, 1, 12, 0, 0))
  end

  test "should be valid" do
    assert @other_event.valid?
  end

  test "name should be present" do
    @other_event.name = ""
    assert_not @other_event.valid?
  end

  test "calendar id should be present" do
    @other_event.calendar_id = ""
    assert_not @other_event.valid?
  end

  test "name should not be too long" do
    @other_event.name = "a" * 255 + "example.com"
    assert_not @other_event.valid?
  end

  test "name should be unigue" do
    @other_event.name = "Elina_Birthday"
    assert_not @other_event.valid?
  end

  test "start time must be present" do
    @other_event.start_time = "      "
    assert_not @other_event.valid?
  end

  test "end time must be present" do
    @other_event.end_time = "      "
    assert_not @other_event.valid?
  end

  test "date must be present" do
    @other_event.date = "      "
    assert_not @other_event.valid?
  end

  test "end time must be after start" do
    @other_event.end_time = Time.zone.local(2000, 1, 1, 10, 0, 0)
    @other_event.start_time = Time.zone.local(2000, 1, 1, 12, 0, 0)
    assert_not @other_event.valid?
  end
end
