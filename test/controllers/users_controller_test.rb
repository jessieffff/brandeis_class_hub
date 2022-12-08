require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @other_user = users(:two)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect when home_calendar when not logged in" do
    get home_calendar_path
    assert_redirected_to login_url
  end

  test "should redirect edit when wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

    test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { first_name: @user.first_name,
      last_name: @user.last_name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: {first_name: @user.first_name,
                                             last_name: @user.last_name,
                                           email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
end
