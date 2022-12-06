require "test_helper"

class OtherEventsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = users(:one)
    log_in_as(@user)
    @other_event = other_events(:two)
  end

  test "should get new" do
    get new_other_event_url
    assert_response :success
  end

  test "should create other_event" do
    get new_other_event_url
    assert_difference("OtherEvent.count") do
      post other_events_url, params: { other_event: { calendar_id: Calendar.first.id, name: @other_event.name, date: @other_event.date, start_time: @other_event.start_time, end_time: @other_event.end_time } }
    end
    assert_redirected_to other_event_url(OtherEvent.last)
  end

  test "should show other_event" do
    OtherEvent.last.update_attribute(:calendar_id, Calendar.first.id)
    get other_event_url(OtherEvent.last)
    assert_select "h1", "Event Information"
  end

  test "should get edit" do
    get edit_other_event_url(@other_event)
    assert_response :success
  end

  test "should update other_event" do
    get edit_other_event_url @other_event
    patch other_event_url(@other_event), params: { other_event: { calendar_id: Calendar.first.id, name: @other_event.name, date: @other_event.date, start_time: @other_event.start_time, end_time: @other_event.end_time } }
    assert_redirected_to other_event_url(@other_event)
  end

  test "should destroy other_event" do
    assert_difference("OtherEvent.count", -1) do
      delete other_event_url(@other_event)
    end

    assert_redirected_to home_calendar_url
  end
end
