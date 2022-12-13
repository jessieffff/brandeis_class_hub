require "application_system_test_case"

class HomeCalendarTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "should select month from picker" do
    visit home_calendar_url
    fill_in "datepicker", with: Date.new(2022, 10, 24)
    click_on "Find"
    assert_text "October 2022"
  end

  test "get next month" do
    visit home_calendar_url + '?date=2023-01-01'
    click_on "Next Month"
    assert_text "February 2023"
  end

  test "get prev month" do
    visit home_calendar_url + '?date=2023-01-01'
    click_on "Last Month"
    assert_text "December 2022"
  end

  test "get day view" do
    visit home_calendar_url + '?date=2023-01-01'
    click_on "Day View"
    assert_text "Previous Day"
  end

  test "get week view" do
    visit home_calendar_url + '?date=2023-01-01'
    click_on "Week View"
    assert_text "Last Week"
  end
  
  test "get month view" do
    visit home_calendar_url + '?date=2023-01-01'
    click_on "Month View"
    assert_text "Last Month"
  end

  test "get next day" do
    visit home_calendar_url + '?date=2022-12-31'
    click_on "Day View"
    click_on "Next Day"
    assert_text "January 2023"
  end

  test "get prev day" do
    visit home_calendar_url + '?date=2023-01-01'
    click_on "Day View"
    click_on "Previous Day"
    assert_text "December 2022"
  end

  test "get prev week" do
    visit home_calendar_url + '?date=2023-01-01'
    click_on "Week View"
    click_on "Last Week"
    assert_text "December 2022"
  end

  test "get next week" do
    visit home_calendar_url + '?date=2022-12-31&view=week'
    click_on "Week View"
    click_on "Next Week"
    assert_text "January 2023"
  end


end