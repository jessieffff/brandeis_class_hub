require "test_helper"

class OtherEventsTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "needs name" do
    get new_other_event_url
    assert_no_difference("OtherEvent.count") do
        post other_events_url, params: { other_event: { calendar_id: Calendar.first.id, date: Date.new(2022, 11, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), slug: "other_event" } }
    end
    assert_select "li", "Name can't be blank"
    assert_response :unprocessable_entity
    assert_template 'other_events/new'
  end

  test "needs calendar" do
    get new_other_event_url
    assert_no_difference("OtherEvent.count") do
        post other_events_url, params: { other_event: { name: "Test Cool", date: Date.new(2022, 11, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), slug: "other_event" } }
    end
    assert_select "li", "Calendar can't be blank"
    assert_response :unprocessable_entity
    assert_template 'other_events/new'
  end

  test "needs start time" do
    get new_other_event_url
    assert_no_difference("OtherEvent.count") do
        post other_events_url, params: { other_event: { calendar_id: Calendar.first.id, name: "Test54", date: Date.new(2022, 11, 7), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), slug: "other_event" } }
    end
    assert_select "li", "Start time can't be blank"
    assert_response :unprocessable_entity
    assert_template 'other_events/new'
  end

  test "needs end time" do
    get new_other_event_url
    assert_no_difference("OtherEvent.count") do
        post other_events_url, params: { other_event: { calendar_id: Calendar.first.id, name: "Test54", date: Date.new(2022, 11, 7), start_time: Time.zone.local(2000, 1, 1, 12, 0, 0), slug: "other_event" } }
    end
    assert_select "li", "End time can't be blank"
    assert_response :unprocessable_entity
    assert_template 'other_events/new'
  end

  test "end time must be after start" do
    get new_other_event_url
    assert_no_difference("OtherEvent.count") do
        post other_events_url, params: { other_event: { calendar_id: Calendar.first.id, name: "Test65", date: Date.new(2022, 11, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 6, 0, 0), slug: "other_event" } }
    end
    assert_select "li", "End time must be after Start time"
    assert_response :unprocessable_entity
    assert_template 'other_events/new'
  end

end