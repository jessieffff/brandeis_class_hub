require "test_helper"

class AssignmentsTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "should not create if no name" do
    get new_assignment_url
    assert_no_difference("Assignment.count") do
        post assignments_url, params: { assignment: { calendar_id: Calendar.first.id, due_date: Date.new(2022, 12, 7), due_time: Time.zone.local(2000, 1, 1, 10, 0, 0), course_id: Course.first.id, slug: "new_assignment" }}
    end
    assert_select "li", "Name can't be blank"
    assert_response :unprocessable_entity
    assert_template 'assignments/new'
  end

  test "should not create if no due date" do
    get new_assignment_url
    assert_no_difference("Assignment.count") do
        post assignments_url, params: { assignment: { calendar_id: Calendar.first.id, name: "Test thingy", due_time: Time.zone.local(2000, 1, 1, 10, 0, 0), course_id: Course.first.id, slug: "new_assignment" }}
    end
    assert_select "li", "Due date can't be blank"
    assert_response :unprocessable_entity
    assert_template 'assignments/new'
  end

  test "should not create if no due time" do
    get new_assignment_url
    assert_no_difference("Assignment.count") do
        post assignments_url, params: { assignment: { calendar_id: Calendar.first.id, name: "Test thingy", due_date: Date.new(2022, 12, 7), course_id: Course.first.id, slug: "new_assignment" }}
    end
    assert_select "li", "Due time can't be blank"
    assert_response :unprocessable_entity
    assert_template 'assignments/new'
  end

end