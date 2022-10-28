require "application_system_test_case"

class OtherEventsTest < ApplicationSystemTestCase
  setup do
    @other_event = other_events(:one)
  end

  test "visiting the index" do
    visit other_events_url
    assert_selector "h1", text: "Other events"
  end

  test "should create other event" do
    visit other_events_url
    click_on "New other event"

    fill_in "Calendar", with: @other_event.calendar_id
    fill_in "End time", with: @other_event.end_time
    fill_in "Other name", with: @other_event.other_name
    fill_in "Start time", with: @other_event.start_time
    click_on "Create Other event"

    assert_text "Other event was successfully created"
    click_on "Back"
  end

  test "should update Other event" do
    visit other_event_url(@other_event)
    click_on "Edit this other event", match: :first

    fill_in "Calendar", with: @other_event.calendar_id
    fill_in "End time", with: @other_event.end_time
    fill_in "Other name", with: @other_event.other_name
    fill_in "Start time", with: @other_event.start_time
    click_on "Update Other event"

    assert_text "Other event was successfully updated"
    click_on "Back"
  end

  test "should destroy Other event" do
    visit other_event_url(@other_event)
    click_on "Destroy this other event", match: :first

    assert_text "Other event was successfully destroyed"
  end
end
