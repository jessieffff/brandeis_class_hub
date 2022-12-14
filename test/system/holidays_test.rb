require "application_system_test_case"

class HolidaysTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    log_in_as(@user)
    @holiday = holidays(:one)
    @holiday_parameters = { calendar_id: Calendar.first.id, name: "new_holiday", date: Date.new(2022, 12, 7), holiday_type: "National", slug: "new_holiday" }
  end

  test "should create holiday" do
    log_in_as(@user)
    visit new_holiday_url
    

    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @holiday_parameters[:name]
    fill_in "Date", with: @holiday_parameters[:date]
    select "Holiday type", with: "Brandeis Holiday"
    click_on "Submit"
    
    assert_text "Holiday was successfully created"
    click_on "Back"
  end

  test "need holiday name" do
    log_in_as(@user)
    visit new_holiday_url
    

    select 'TestCal2', :from => 'Calendar'
    fill_in "Date", with: @holiday_parameters[:date]
    select "Holiday type", with: "Brandeis Holiday"
    click_on "Submit"
    
    assert_text "Name can't be blank"

    fill_in "Name", with: @holiday_parameters[:name]
    click_on "Submit"
    
    assert_text "Holiday was successfully created"
    click_on "Back"
  end

  test "need holiday date" do
    log_in_as(@user)
    visit new_holiday_url
    

    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @holiday_parameters[:name]
    select "Holiday type", with: "Brandeis Holiday"
    click_on "Submit"
    
    assert_text "Date can't be blank"

    fill_in "Date", with: @holiday_parameters[:date]
    click_on "Submit"
    
    assert_text "Holiday was successfully created"
    click_on "Back"
  end

  test "need holiday type" do
    log_in_as(@user)
    visit new_holiday_url
    

    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @holiday_parameters[:name]
    fill_in "Date", with: @holiday_parameters[:date]
    click_on "Submit"
    
    assert_text "Holiday type can't be blank"

    select "Holiday type", with: "Brandeis Holiday"
    click_on "Submit"
    
    assert_text "Holiday was successfully created"
    click_on "Back"
  end

  test "should update holiday" do
    log_in_as(@user)
    @holiday.update_attribute(:calendar_id, Calendar.first.id)
    visit calendar_holiday_path(Calendar.find_by(id: @holiday.calendar_id).invite_token, @holiday.slug)
    
    click_on "Edit", match: :first

    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @holiday.name
    fill_in "Date", with: @holiday.date
    select "Holiday type", with: "Brandeis Holiday"
    click_on "Submit"
    

    assert_text "Holiday was successfully updated"
    click_on "Back"
  end
end
