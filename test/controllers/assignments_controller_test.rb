require "test_helper"

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @assignment = assignments(:one)
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create assignment" do
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
