require "application_system_test_case"
class CoursesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    log_in_as(@user)
    @course = courses(:one)
    @course.update_attribute(:calendar_id, Calendar.first.id)
    @course_parameters = { calendar_id: Calendar.first.id, name: "new_course", start_date: Date.new(2022, 12, 7), end_date: Date.new(2023, 2, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), professor_name: "Steve", repetition_frequency: "MW", slug: "new_course" }
  end

  test "should create course" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "need name" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Name can't be blank"

    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "need calendar" do
    visit new_course_url
    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Calendar must exist"

    select 'TestCal2', :from => 'Calendar'
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "need start date" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course_parameters[:name]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Start date can't be blank"

    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Start date", with: @course_parameters[:start_date]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "need end date" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "End date can't be blank"

    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "End date", with: @course_parameters[:end_date]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "need start time" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Start time can't be blank"

    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "need end time" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "End time can't be blank"

    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "need professor name" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Professor name can't be blank"

    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "need repetition frequency name" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    click_on "Submit"
    assert_text "Repetition frequency can't be blank"

    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "must end time after start time" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "Start time", with: @course_parameters[:end_time]
    fill_in "End time", with: @course_parameters[:start_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "End time must be after Start time"

    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "must end date after start date" do
    visit new_course_url
    select 'TestCal2', :from => 'Calendar'
    fill_in "Name", with: @course_parameters[:name]
    fill_in "Start date", with: @course_parameters[:end_date]
    fill_in "End date", with: @course_parameters[:start_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    fill_in "Professor name", with: @course_parameters[:professor_name]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "End date must be after Start date"

    fill_in "Start date", with: @course_parameters[:start_date]
    fill_in "End date", with: @course_parameters[:end_date]
    fill_in "Start time", with: @course_parameters[:start_time]
    fill_in "End time", with: @course_parameters[:end_time]
    check "course_repetition_frequency_m"
    check "course_repetition_frequency_w"
    click_on "Submit"
    assert_text "Course was successfully created"
    click_on "Back"
  end


  test "should update course" do
    @course.update_attribute(:calendar_id, Calendar.first.id)
     visit calendar_course_url(Calendar.find_by(id: Course.last.calendar_id).invite_token, Course.last.slug)
     click_on "Edit", match: :first

     select 'TestCal2', :from => 'Calendar'
     fill_in "Name", with: @course.name
     fill_in "End date", with: @course.end_date
     fill_in "Professor name", with: @course.professor_name
     fill_in "Start date", with: @course.start_date
     fill_in "Start time", with: @course.start_time
     fill_in "End time", with: @course.end_time
     check "course_repetition_frequency_m"
     check "course_repetition_frequency_w"
     click_on "Submit"

     assert_text "Course was successfully updated"
     click_on "Back"
   end

  test "go to New Calendar" do
    visit new_course_url
    click_on "Create a New Calendar"
    assert_text "New calendar"
  end
end
