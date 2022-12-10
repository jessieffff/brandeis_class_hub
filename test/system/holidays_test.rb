#Need to fix this

# require "application_system_test_case"

# class HolidaysTest < ApplicationSystemTestCase
#   setup do
#     @holiday = holidays(:one)
#     @user = users(:one)
#     log_in_as(@user)
#     @holiday_parameters = { calendar_id: Calendar.first.id, name: "new_holiday", date: Date.new(2022, 12, 7), holiday_type: "National", slug: "new_holiday" }
#   end

#   test "should create holiday" do
#     visit new_holiday_url

#     select 'TestCal2', :from => 'Calendar'
#     fill_in "Name", with: @holiday_parameters[:name]
#     fill_in "Date", with: @holiday_parameters[:date]
#     fill_in "Holiday type", with: @holiday_parameters[:holiday_type]
#     click_on "Submit"

#     assert_text "Holiday was successfully created"
#     click_on "Back"
#   end

# #   test "need holiday name" do
# #     visit new_holiday_url

# #     select 'TestCal2', :from => 'Calendar'
# #     fill_in "Date", with: @holiday_parameters[:date]
# #     fill_in "Holiday type", with: @holiday_parameters[:holiday_type]
# #     click_on "Submit"
# #     assert_text "Name can't be blank"

# #     fill_in "Name", with: @holiday_parameters[:name]
# #     assert_text "Holiday was successfully created"
# #     click_on "Back"
# #   end

  
# #   test "should update Holiday" do
# #     visit holiday_url(@holiday)
# #     click_on "Edit this holiday", match: :first

# #     fill_in "Calendar", with: @holiday.calendar_id
# #     fill_in "Date", with: @holiday.date
# #     fill_in "Holiday name", with: @holiday.holiday_name
# #     fill_in "Holiday type", with: @holiday.holiday_type
# #     click_on "Update Holiday"

# #     assert_text "Holiday was successfully updated"
# #     click_on "Back"
# #   end

# #   test "should destroy Holiday" do
# #     visit holiday_url(@holiday)
# #     click_on "Destroy this holiday", match: :first

# #     assert_text "Holiday was successfully destroyed"
# #   end
# end
