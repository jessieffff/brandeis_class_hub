require "application_system_test_case"

class AssignmentsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    log_in_as(@user)
    @assignment = assignments(:two)
    @assignment.update_attribute(:course_id, Course.first.id)
    @assignment.update_attribute(:calendar_id, Calendar.first.id)
    @assignment_parameters = { calendar_id: Calendar.first.id, name: "new_assignment2", due_date: Date.new(2022, 12, 7), due_time: Time.zone.local(2000, 1, 1, 10, 0, 0), course_id: Course.first.id, slug: "new_assignment" }
    @course = courses(:one)
    @course.update_attribute(:calendar_id, Calendar.first.id)
  end

  test "should create assignment" do
    visit new_assignment_url
    select 'TestCal2', :from => 'Calendar'
    select @course.name, :from => 'Course'
    fill_in "Name", with: @assignment_parameters[:name]
    fill_in "Due date", with: @assignment.due_date
    fill_in "Due time", with: @assignment.due_time
    click_on "Submit"
    assert_text "Assignment was successfully created"
    click_on "Back"
  end

  test "should no create if no calendar" do
    visit new_assignment_url
    select @course.name, :from => 'Course'
    fill_in "Name", with: @assignment_parameters[:name]
    fill_in "Due date", with: @assignment.due_date
    fill_in "Due time", with: @assignment.due_time
    click_on "Submit"

    assert_text "Calendar can't be blank"
    select 'TestCal2', :from => 'Calendar'
    click_on "Submit"
    assert_text "Assignment was successfully created"
    click_on "Back"
  end

#   test "should not create if no name" do
#     visit assignments_url
#     click_on "New assignment"

#     fill_in "Calendar", with: @assignment.calendar_id
#     fill_in "Course", with: @assignment.course_id
#     fill_in "Due date", with: @assignment.due_date
#     click_on "Create Assignment"

#     assert_select "error_reason" "Name can't be blank"
#     click_on "Back"
#   end

#   test "should update Assignment" do
#     visit assignment_url(@assignment)
#     click_on "Edit this assignment", match: :first

#     fill_in "Assignment name", with: @assignment.name
#     fill_in "Calendar", with: @assignment.calendar_id
#     fill_in "Course", with: @assignment.course_id
#     fill_in "Due date", with: @assignment.due_date
#     click_on "Update Assignment"

#     assert_text "Assignment was successfully updated"
#     click_on "Back"
#   end

#   test "should destroy Assignment" do
#     visit assignment_url(@assignment)
#     click_on "Destroy this assignment", match: :first

#     assert_text "Assignment was successfully destroyed"
#   end
end
