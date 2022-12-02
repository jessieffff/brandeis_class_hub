require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
  end

  test "should get new" do
  end

  test "should create user" do
  end

  test "should show user" do
  end

  test "should get edit" do
  end

  test "should update user" do
  end

  test "should destroy user" do
  end

    test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

    test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { full_name: @user.full_name, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
