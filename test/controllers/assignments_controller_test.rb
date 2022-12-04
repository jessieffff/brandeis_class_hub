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
    assert_difference("Assignment.count") do
      post assignments_url, params: { assignment: { calendar_id: @assignment.calendar_id,
                                                    name: @assignment.name, due_date: @assignment.due_date,
                                                    due_time: @assignment.due_time, course_id: @assignment.course_id} }
    end
    assert_redirected_to assignment_url(Assignment.last)
  end

  test "should show assignment" do
  end

  test "should get edit" do
  end

  test "should update assignment" do
  end

  test "should destroy assignment" do
  end
end
