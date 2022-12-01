require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "get url" do
    calendar = Calendar.create(id: 2, invite_token:"Test")
    event = Holiday.create(id: 1, calendar_id: 2, name: "Christmas")
    paths = {calendar: "calendarsURL", holiday: "holidayURL", assignment: "assignmentURL",
             class_period: "class_periodURL", other_event: "other_eventURL"}
    puts event.calendar_id
    assert_equal(Event.getURL(event, paths), "calendars/Test/holidays/christmas")
    
  end
end