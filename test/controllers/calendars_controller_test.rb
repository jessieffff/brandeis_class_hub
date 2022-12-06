require "test_helper"

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @calendar = calendars(:one)
  end

  # test "should get new" do
  #   get new_calendar_url
  #   assert_response :success
  # end

  # test "should create calendar" do
  #   get new_calendar_url
  #   assert_difference("Calendar.count") do
  #     post calendars_url, params: { calendar: { user_id: @calendar.id, name: @calendar.name, description: @calendar.description, shared: @calendar.shared} }
  #   end
  #   assert_redirected_to calendar_url(Calendar.last)
  # end

  # test "should show calendar" do
  # end

  # test "should get edit" do
  # end

  # test "should update calendar" do
  # end

  # test "should destroy calendar" do
  # end
end
