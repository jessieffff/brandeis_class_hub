require "test_helper"

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @assignment = assignments(:two)
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create assignment" do
    get new_assignment_url
    assert_difference("Assignment.count") do
      post assignments_url, params: { assignment: { calendar_id: Calendar.first.id, name: @assignment.name, due_date: @assignment.due_date, due_time: @assignment.due_time, course_id: @assignment.course_id} }
    end
    assert_redirected_to assignment_url(Assignment.last)
  end

  test "should show assignment" do
    Assignment.last.update_attribute(:course_id, Course.first.id)
    Assignment.last.update_attribute(:calendar_id, Calendar.first.id)
    get assignment_url(Assignment.last)
    assert_select "h3", "Test_Assignment"
  end

  test "should get edit" do
    get edit_assignment_url(@assignment)
    assert_response :success
  end

  test "should update assignment" do
    get edit_assignment_url @assignment
    patch assignment_url(@assignment), params: { assignment: { calendar_id: Calendar.first.id, name: @assignment.name, due_date: @assignment.due_date, due_time: @assignment.due_time, course_id: @assignment.course_id} }
    assert_redirected_to assignment_url(@assignment)
  end

  test "should destroy assignment" do
    assert_difference("Assignment.count", -1) do
      delete assignment_url(@assignment)
    end

    assert_redirected_to home_calendar_url
  end
end
