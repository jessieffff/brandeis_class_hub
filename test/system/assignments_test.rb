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

  test "should not create if no calendar" do
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

  test "should not create if no name" do
    visit new_assignment_url
    select @course.name, :from => 'Course'
    select 'TestCal2', :from => 'Calendar'
    fill_in "Due date", with: @assignment.due_date
    fill_in "Due time", with: @assignment.due_time
    click_on "Submit"

    assert_text "Name can't be blank"
    fill_in "Name", with: @assignment_parameters[:name]
    click_on "Submit"
    assert_text "Assignment was successfully created"
    click_on "Back"
  end

  test "should not create if no due date" do
    visit new_assignment_url
    select @course.name, :from => 'Course'
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @assignment_parameters[:name]
    fill_in "Due time", with: @assignment.due_time
    click_on "Submit"

    assert_text "Due date can't be blank"
    fill_in "Due date", with: @assignment.due_date
    click_on "Submit"
    assert_text "Assignment was successfully created"
    click_on "Back"
  end

  test "should not create if no due time" do
    visit new_assignment_url
    select @course.name, :from => 'Course'
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @assignment_parameters[:name]
    fill_in "Due date", with: @assignment.due_date
    click_on "Submit"

    assert_text "Due time can't be blank"
    fill_in "Due time", with: @assignment.due_time
    click_on "Submit"
    assert_text "Assignment was successfully created"
    click_on "Back"
  end

  test "should update assignment" do
    Assignment.last.update_attribute(:calendar_id, Calendar.first.id)
    Assignment.last.update_attribute(:course_id, Course.first.id)
    visit calendar_course_assignment_url(Calendar.find_by(id: Assignment.last.calendar_id).invite_token, 
                                          Course.find_by(id: Assignment.last.course_id).slug, Assignment.last.slug)
    click_on "Edit", match: :first
    select 'TestCal2', :from => 'Calendar'
    select Course.first.name, :from => 'Course'
    fill_in "Name", with: @assignment_parameters[:name]
    fill_in "Due date", with: @assignment[:due_date]
    fill_in "Due time", with: @assignment[:due_time]
    click_on "Submit"
    assert_text "Assignment was successfully updated"
    click_on "Back"
  end

end
