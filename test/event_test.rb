require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "get url" do
    calendar = Calendar.create(name: "Test", id: 2, invite_token:"Test")
    event = Holiday.create(id: 1, calendar_id: 2, name: "Christmas")
    paths = {calendar: "calendars", holiday: "holidays", assignment: "assignments",
             class_period: "class_periods", other_event: "other_events"}
    puts event.calendar_id
    assert_equal(Event.getURL(event, paths), "calendars/Test/holidays/christmas")
    
  end
end