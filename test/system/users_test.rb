require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  def setup
    @user_params = {first_name: "Example3", last_name: "User3", email: "user3@brandeis.edu",
                     password: "foobar", password_confirmation: "foobar"}
  end

  test "should create user" do
    visit signup_url

    fill_in "Enter first name", with: @user_params[:first_name]
    fill_in "Enter last name", with: @user_params[:last_name]
    fill_in "Enter email", with: @user_params[:email]
    fill_in "Enter password", with: "foobar"
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"

    assert_text "User was successfully created"
  end

  test "needs first name" do
    visit signup_url

    fill_in "Enter last name", with: @user_params[:last_name]
    fill_in "Enter email", with: @user_params[:email]
    fill_in "Enter password", with: "foobar"
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"
    assert_text "First name can't be blank"

    fill_in "Enter first name", with: @user_params[:first_name]
    fill_in "Enter password", with: "foobar"
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"
    assert_text "User was successfully created"
  end

  test "needs last name" do
    visit signup_url

    fill_in "Enter first name", with: @user_params[:first_name]
    fill_in "Enter email", with: @user_params[:email]
    fill_in "Enter password", with: "foobar"
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"
    assert_text "Last name can't be blank"

    fill_in "Enter last name", with: @user_params[:last_name]
    fill_in "Enter password", with: "foobar"
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"
    assert_text "User was successfully created"
  end

  test "needs email" do
    visit signup_url

    fill_in "Enter first name", with: @user_params[:first_name]
    fill_in "Enter last name", with: @user_params[:last_name]
    fill_in "Enter password", with: "foobar"
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"
    assert_text "Email can't be blank"

    fill_in "Enter email", with: @user_params[:email]
    fill_in "Enter password", with: "foobar"
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"
    assert_text "User was successfully created"
  end

  test "needs password" do
    visit signup_url

    fill_in "Enter first name", with: @user_params[:first_name]
    fill_in "Enter last name", with: @user_params[:last_name]
    fill_in "Enter email", with: @user_params[:email]
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"
    assert_text "Password can't be blank"

    fill_in "Enter password", with: "foobar"
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"
    assert_text "User was successfully created"
  end

  test "needs confirmed password" do
    visit signup_url

    fill_in "Enter first name", with: @user_params[:first_name]
    fill_in "Enter last name", with: @user_params[:last_name]
    fill_in "Enter email", with: @user_params[:email]
    fill_in "Enter password", with: "foobar"
    click_on "Create account"
    assert_text "Password confirmation doesn't match Password"

    fill_in "Enter password", with: "foobar"
    fill_in "Confirm password", with: "foobar"
    click_on "Create account"
    assert_text "User was successfully created"
    
  end

end
