require "application_system_test_case"
class CoursesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    log_in_as(@user)
    @course = courses(:one)
  end

  test "should create course" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course.name
    fill_in "Start date", with: @course.start_date
    fill_in "End date", with: @course.end_date
    fill_in "Start time", with: @course.start_time
    fill_in "End time", with: @course.end_time
    fill_in "Professor name", with: @course.professor_name
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "should update course" do
     visit courses_url(@course).gsub(".", "/")
     click_on "Edit this course", match: :first

     fill_in "Calendar", with: @course.calendar_id
     fill_in "Name", with: @course.name
     fill_in "End date", with: @course.end_date
     fill_in "Professor name", with: @course.professor_name
     fill_in "Meeting days", with: @course.repetition_frequency
     fill_in "Start date", with: @course.start_date
     fill_in "Start time", with: @course.start_time
     fill_in "End time", with: @course.end_time
     check "course_repetition_frequency_m"
     check "course_repetition_frequency_w"
     click_on "Submit"

     assert_text "Course was successfully updated"
     click_on "Back"
   end

  # test "should destroy Course" do
  #   visit course_url(@course)
  #   click_on "Destroy this course", match: :first

  #   assert_text "Course was successfully destroyed"
  # end
end
