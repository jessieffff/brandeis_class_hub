require "test_helper"

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @calendar = calendars(:one)
  end

  test "should get new" do
    get new_calendar_url
    assert_response :success
  end

  test "should create calendar" do
    get new_calendar_url
    assert_difference("Calendar.count") do
      post calendars_url, params: { calendar: { user_id: @calendar.id, name: @calendar.name, description: @calendar.description, shared: @calendar.shared} }
    end
    assert_redirected_to home_calendar_url
  end

  test "should show calendar" do
    get calendar_url(@calendar)
    assert_select "h3", "Import Courses to this Calendar"
  end

  test "should get edit" do
    get edit_calendar_path(@calendar)
    assert_response :success
  end

  test "should update calendar" do
    get edit_calendar_path(@calendar)
    patch calendar_url(@calendar), params: {calendar: {name: "new_calendar"}}
    assert_redirected_to home_calendar_url
  end

  test "should destroy calendar" do
    prev_calendar_id = @calendar.id
    assert_difference("Calendar.count", -1) do
      delete calendar_url(@calendar)
    end

    assert_redirected_to calendars_path
  end
end
