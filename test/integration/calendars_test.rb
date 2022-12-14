require "test_helper"

class CalendarsTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "should create calendar" do
    get new_calendar_path
    assert_difference 'Calendar.count', 1 do
        post calendars_path, params: { calendar: {name: "Test10", description: "Hello Sir", shared: true}}
    end
    assert_redirected_to home_calendar_url
  end

  test "should update calendar" do
    get new_calendar_path
    post calendars_path, params: { calendar: {name: "Test10", description: "Hello Sir", shared: true}}
    get edit_calendar_path(Calendar.last)
    patch calendar_url(Calendar.last), params: {calendar: {name: "new_calendar"}}
    assert_redirected_to home_calendar_path
    assert_equal Calendar.last.name, "new_calendar"
  end

  test "must have name" do
    get new_calendar_path
    assert_no_difference 'Calendar.count' do
        post calendars_path, params: { calendar: {description: "Hello Sir", shared: true}}
    end
    assert_response :unprocessable_entity
    assert_template 'calendars/new'
  end

  test "destroy" do
    get new_calendar_path
    post calendars_path, params: { calendar: {name: "Test10", description: "Hello Sir", shared: true}}

    get calendar_path(Calendar.last)
    assert_difference 'Calendar.count', -1 do
        delete calendar_url(Calendar.last)
    end

  end
end
