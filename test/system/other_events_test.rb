require "application_system_test_case"

class OtherEventsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    log_in_as(@user)
    @other_event = other_events(:two)
    @other_event.update_attribute(:calendar_id, Calendar.first.id)
    @other_event_parameters = { calendar_id: Calendar.first.id, name: "other_event", date: Date.new(2022, 11, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), slug: "other_event" }
  end

   test "should create other event" do
    visit new_other_event_url

    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @other_event_parameters[:name]
    fill_in "Date", with: @other_event_parameters[:date]
    fill_in "Start time", with: @other_event_parameters[:start_time]
    fill_in "End time", with: @other_event_parameters[:end_time]
    click_on "Submit"

    assert_text "Event was successfully created"
    click_on "Back"
   end

   test "needs name" do
    visit new_other_event_url

    select 'TestCal2', :from => 'Calendar'
    
    fill_in "Date", with: @other_event_parameters[:date]
    fill_in "Start time", with: @other_event_parameters[:start_time]
    fill_in "End time", with: @other_event_parameters[:end_time]
    click_on "Submit"

    assert_text "Name can't be blank"
    fill_in "Name", with: @other_event_parameters[:name]
    click_on "Submit"
    assert_text "Event was successfully created"
    click_on "Back"
   end

   test "needs calendar" do
    visit new_other_event_url

    fill_in "Name", with: @other_event_parameters[:name]
    fill_in "Date", with: @other_event_parameters[:date]
    fill_in "Start time", with: @other_event_parameters[:start_time]
    fill_in "End time", with: @other_event_parameters[:end_time]
    click_on "Submit"

    assert_text "Calendar can't be blank"
    select 'TestCal2', :from => 'Calendar'
    click_on "Submit"
    assert_text "Event was successfully created"
    click_on "Back"
   end

   test "needs start time" do
    visit new_other_event_url

    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @other_event_parameters[:name]
    fill_in "Date", with: @other_event_parameters[:date]
    fill_in "End time", with: @other_event.end_time
    click_on "Submit"

    assert_text "Start time can't be blank"
    fill_in "Start time", with: @other_event.start_time
    click_on "Submit"
    assert_text "Event was successfully created"
    click_on "Back"
   end

   test "needs end time" do
    visit new_other_event_url

    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @other_event_parameters[:name]
    fill_in "Date", with: @other_event_parameters[:date]
    fill_in "Start time", with: @other_event.start_time
    click_on "Submit"

    assert_text "End time can't be blank"
    fill_in "End time", with: @other_event.end_time
    click_on "Submit"
    assert_text "Event was successfully created"
    click_on "Back"
   end

   test "should update other event" do
    @other_event.update_attribute(:calendar_id, Calendar.first.id)
    visit calendar_other_event_url(Calendar.find_by(id: @other_event.calendar_id).invite_token, @other_event.slug)
    click_on "Edit", match: :first
    select Calendar.first.name, :from => 'Calendar'
    fill_in "Name", with:  @other_event_parameters[:name]
    fill_in "Date", with: @other_event[:date]
    fill_in "Start time", with: @other_event_parameters[:start_time]
    fill_in "End time", with: @other_event_parameters[:end_time]
    click_on "Submit"

    assert_text "Event was successfully updated"
    click_on "Back"
   end

#   test "should destroy Other event" do
#     visit other_event_url(@other_event)
#     click_on "Destroy this other event", match: :first

#     assert_text "Other event was successfully destroyed"
#   end
end
