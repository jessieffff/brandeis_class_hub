require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "should get calendar" do
    get home_calendar_path
    assert_response :success
    assert_select "title", "BrandeisClassHub"
  end

  test "should get page with month view" do
    get "#{home_calendar_path}?date=11012022&view=month"
    assert_response :success
    assert_select "title", "BrandeisClassHub"
  end

  test "should get page with week view" do
    get "#{home_calendar_path}?date=11012022&view=week"
    assert_response :success
    assert_select "title", "BrandeisClassHub"
  end

  test "should get page with day view" do
    get "#{home_calendar_path}?date=11012022&view=day"
    assert_response :success
    assert_select "title", "BrandeisClassHub"
  end

  test "load proper month" do
    get "#{home_calendar_path}?date=07012023&view=month"
    assert_select "h1", "July 2023"
  end 

  test "load proper week" do
    get "#{home_calendar_path}?date=11132022&view=week"
    assert_select "h1", "November 2022"
  end

  test "load proper day" do
    get "#{home_calendar_path}?date=11132022&view=day"
    assert_select "strong", "13"
  end

end