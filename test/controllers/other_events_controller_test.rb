require "test_helper"

class OtherEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_event = other_events(:one)
  end

  test "should get index" do
    get other_events_url
    assert_response :success
  end

  test "should get new" do
    get new_other_event_url
    assert_response :success
  end

  test "should create other_event" do
    assert_difference("OtherEvent.count") do
      post other_events_url, params: { other_event: { calendar_id: @other_event.calendar_id, end_time: @other_event.end_time, other_name: @other_event.other_name, start_time: @other_event.start_time } }
    end

    assert_redirected_to other_event_url(OtherEvent.last)
  end

  test "should show other_event" do
    get other_event_url(@other_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_other_event_url(@other_event)
    assert_response :success
  end

  test "should update other_event" do
    patch other_event_url(@other_event), params: { other_event: { calendar_id: @other_event.calendar_id, end_time: @other_event.end_time, other_name: @other_event.other_name, start_time: @other_event.start_time } }
    assert_redirected_to other_event_url(@other_event)
  end

  test "should destroy other_event" do
    assert_difference("OtherEvent.count", -1) do
      delete other_event_url(@other_event)
    end

    assert_redirected_to other_events_url
  end
end
