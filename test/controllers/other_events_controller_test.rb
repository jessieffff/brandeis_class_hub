require "test_helper"

class OtherEventsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = users(:one)
    log_in_as(@user)
    @other_event = other_events(:two)
    @other_event.update_attribute(:calendar_id, Calendar.first.id)
    @other_event_parameters = { calendar_id: Calendar.first.id, name: "other_event", date: Date.new(2022, 11, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), slug: "other_event" }
  end

  test "should get new" do
    get new_other_event_url
    assert_response :success
  end

  test "should create other_event" do
    get new_other_event_url
    assert_difference("OtherEvent.count") do
      post other_events_url, params: { other_event: @other_event_parameters }
    end
    assert_redirected_to calendar_other_event_path(Calendar.find_by(id: OtherEvent.last.calendar_id).invite_token, OtherEvent.last.slug)
  end

  test "should show other_event" do
    get calendar_other_event_path(Calendar.find_by(id: @other_event.calendar_id).invite_token, @other_event.slug)
    assert_select "h1", "Event Information"
  end

  test "should get edit" do
    get edit_calendar_other_event_url(Calendar.find_by(id: @other_event.calendar_id).invite_token, @other_event.slug)
    assert_response :success
  end

  test "should update other_event" do
    OtherEvent.last.update_attribute(:calendar_id, Calendar.first.id)
    get edit_calendar_other_event_path(Calendar.find_by(id: OtherEvent.last.calendar_id).invite_token, OtherEvent.last.slug)
    patch calendar_other_event_url(OtherEvent.last), params: { other_event: { calendar_id: Calendar.first.id, name: OtherEvent.last.name, date: OtherEvent.last.date, start_time: OtherEvent.last.start_time, end_time: OtherEvent.last.end_time } }
    assert_redirected_to calendar_path(Calendar.find_by(id: OtherEvent.last.calendar_id))
  end

  test "should destroy other_event" do
    prev_calendar_id = Calendar.find_by(id: @other_event.calendar_id)
    assert_difference("OtherEvent.count", -1) do
      delete calendar_other_event_url(Calendar.find_by(id: @other_event.calendar_id).invite_token, @other_event.slug)
    end

    assert_redirected_to calendar_path(prev_calendar_id)
  end
end
