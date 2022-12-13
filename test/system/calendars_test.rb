require "application_system_test_case"

class CalendarsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    log_in_as(@user)
    @calendar = calendars(:one)
  end

  test "should create calendar" do
    visit home_calendar_url
    click_on "Create a New Calendar"
    fill_in "Name", with: "#{@calendar.name}#{rand(1000)}"
    fill_in "Description", with: @calendar.description
    check "Public" if @calendar.shared
    click_on "Submit"

    assert_text "Calendar was successfully created"
  end

  test "should update calendar" do
    visit calendar_url(@calendar)
    click_on "Edit this Calendar", match: :first
    fill_in "Name", with: "new"
    fill_in "Description", with: @calendar.description
    check "Public" if @calendar.shared
    click_on "Submit"

    assert_text "Calendar was successfully updated"
  end

  test "must have name" do
    visit home_calendar_url
    click_on "Create a New Calendar"
    fill_in "Description", with: @calendar.description
    check "Public" if @calendar.shared
    click_on "Submit"
    assert_text "Name can't be blank"

    fill_in "Name", with: "correct name" + rand(1000)
    click_on "Submit"
    assert_text "Calendar was successfully created"
  end
end
