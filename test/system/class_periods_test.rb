# require "application_system_test_case"

# class ClassPeriodsTest < ApplicationSystemTestCase
#   setup do
#     @class_period = class_periods(:one)
#   end

#   test "visiting the index" do
#     visit class_periods_url
#     assert_selector "h1", text: "Class periods"
#   end

#   test "should create class period" do
#     visit class_periods_url
#     click_on "New class period"

#     fill_in "Course", with: @class_period.course_id
#     fill_in "End time", with: @class_period.end_time
#     fill_in "Start time", with: @class_period.start_time
#     click_on "Create Class period"

#     assert_text "Class period was successfully created"
#     click_on "Back"
#   end

#   test "should update Class period" do
#     visit class_period_url(@class_period)
#     click_on "Edit this class period", match: :first

#     fill_in "Course", with: @class_period.course_id
#     fill_in "End time", with: @class_period.end_time
#     fill_in "Start time", with: @class_period.start_time
#     click_on "Update Class period"

#     assert_text "Class period was successfully updated"
#     click_on "Back"
#   end

#   test "should destroy Class period" do
#     visit class_period_url(@class_period)
#     click_on "Destroy this class period", match: :first

#     assert_text "Class period was successfully destroyed"
#   end
# end
