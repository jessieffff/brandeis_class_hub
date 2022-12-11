require "application_system_test_case"

class ClassPeriodsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    log_in_as(@user)
    @class_period = class_periods(:one)
    @class_period.update_attribute(:calendar_id, Calendar.first.id)
    @class_period.update_attribute(:course_id, Course.first.id)
    @class_period_parameters = { calendar_id: Calendar.first.id, course_id: Course.first.id, name: "class_period", date: Date.new(2022, 11, 17), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), slug: "class_period" }
end

  test "should update Class period" do
    visit calendar_course_class_period_url(Calendar.find_by(id: @class_period.calendar_id).invite_token, 
    Course.find_by(id: @class_period.course_id).slug, ClassPeriod.last.id)
    click_on "Edit", match: :first

    fill_in "Date", with: @class_period_parameters[:date]
    fill_in "End time", with: @class_period_parameters[:end_time]
    fill_in "Start time", with: @class_period_parameters[:start_time]
    click_on "Submit"

    assert_text "Class period was successfully updated"
    click_on "Back"
  end

  test "end time must be after start time" do
    visit calendar_course_class_period_url(Calendar.find_by(id: @class_period.calendar_id).invite_token, 
    Course.find_by(id: @class_period.course_id).slug, ClassPeriod.last.id)
    click_on "Edit", match: :first

    fill_in "Date", with: @class_period_parameters[:date]
    fill_in "End time", with: @class_period_parameters[:start_time]
    fill_in "Start time", with: @class_period_parameters[:end_time]
    click_on "Submit"
    assert_text "End time must be after Start time"

    fill_in "End time", with: @class_period_parameters[:end_time]
    fill_in "Start time", with: @class_period_parameters[:start_time]
    click_on "Submit"
    assert_text "Class period was successfully updated"
    click_on "Back"
  end
end
