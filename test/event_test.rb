require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "get url" do
    event = Holiday.create(id: 1, calendar_id: 2, name: "Christmas")
    paths = {holiday: "holidayURL", assignment: "assignmentURL",
             class_period: "class_periodURL", other_event: "other_eventURL"}
    assert_equal(Event.getURL(event, paths), "holidayURL/1")
    
  end
end