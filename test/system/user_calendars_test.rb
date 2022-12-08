# require "application_system_test_case"

# class UserCalendarsTest < ApplicationSystemTestCase
#   setup do
#     @user_calendar = user_calendars(:one)
#   end

#   test "visiting the index" do
#     visit user_calendars_url
#     assert_selector "h1", text: "User calendars"
#   end

#   test "should create user calendar" do
#     visit user_calendars_url
#     click_on "New user calendar"

#     fill_in "Calendar", with: @user_calendar.calendar_id
#     fill_in "User", with: @user_calendar.user_id
#     click_on "Create User calendar"

#     assert_text "User calendar was successfully created"
#     click_on "Back"
#   end

#   test "should update User calendar" do
#     visit user_calendar_url(@user_calendar)
#     click_on "Edit this user calendar", match: :first

#     fill_in "Calendar", with: @user_calendar.calendar_id
#     fill_in "User", with: @user_calendar.user_id
#     click_on "Update User calendar"

#     assert_text "User calendar was successfully updated"
#     click_on "Back"
#   end

#   test "should destroy User calendar" do
#     visit user_calendar_url(@user_calendar)
#     click_on "Destroy this user calendar", match: :first

#     assert_text "User calendar was successfully destroyed"
#   end
# end
