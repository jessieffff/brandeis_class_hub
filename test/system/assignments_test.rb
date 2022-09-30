require "application_system_test_case"

class AssignmentsTest < ApplicationSystemTestCase
  setup do
    @assignment = assignments(:one)
  end

  test "visiting the index" do
    visit assignments_url
    assert_selector "h1", text: "Assignments"
  end

  test "should create assignment" do
    visit assignments_url
    click_on "New assignment"

    fill_in "Class", with: @assignment.class_id
    fill_in "Due date", with: @assignment.due_date
    fill_in "Event category", with: @assignment.event_category
    fill_in "Event", with: @assignment.event_id
    fill_in "Event name", with: @assignment.event_name
    click_on "Create Assignment"

    assert_text "Assignment was successfully created"
    click_on "Back"
  end

  test "should update Assignment" do
    visit assignment_url(@assignment)
    click_on "Edit this assignment", match: :first

    fill_in "Class", with: @assignment.class_id
    fill_in "Due date", with: @assignment.due_date
    fill_in "Event category", with: @assignment.event_category
    fill_in "Event", with: @assignment.event_id
    fill_in "Event name", with: @assignment.event_name
    click_on "Update Assignment"

    assert_text "Assignment was successfully updated"
    click_on "Back"
  end

  test "should destroy Assignment" do
    visit assignment_url(@assignment)
    click_on "Destroy this assignment", match: :first

    assert_text "Assignment was successfully destroyed"
  end
end
