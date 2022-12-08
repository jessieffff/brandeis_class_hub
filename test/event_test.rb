require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "get url" do
    calendar = Calendar.create(name: "Test", user_id: 2, invite_token: "Test")
    event = Holiday.create(calendar_id: calendar.id, name: "Christmas", date: Date.new(2022, 10, 30), holiday_type: "Party")
    paths = {calendar: "calendars", holiday: "holidays", assignment: "assignments",
             class_period: "class_periods", other_event: "other_events"}
    assert_equal(Event.getURL(event, paths), "calendars/Test/holidays/christmas")
    
  end
end