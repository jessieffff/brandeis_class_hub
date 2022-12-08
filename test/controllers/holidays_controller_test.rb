require "test_helper"

class HolidaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @holiday_parameters = { calendar_id: Calendar.first.id, name: "new_holiday", date: Date.new(2022, 12, 7), holiday_type: "National", slug: "new_holiday" }
  end


  test "should get new" do
    get new_holiday_url
    assert_response :success
  end

  test "should create holiday" do
    get new_holiday_url
    assert_difference("Holiday.count") do
      post holidays_url, params: { holiday: @holiday_parameters }
    end
    assert_redirected_to calendar_holiday_path(Calendar.find_by(id: Holiday.last.calendar_id).invite_token, Holiday.last.slug)
  end

  test "should show holiday" do
    Holiday.create(@holiday_parameters)
    Holiday.last.update_attribute(:calendar_id, Calendar.first.id)
    get calendar_holiday_path(Calendar.find_by(id: Holiday.last.calendar_id).invite_token, Holiday.last.slug)
    assert_select "h3", "new_holiday"
  end

  test "should get edit" do
    Holiday.last.update_attribute(:calendar_id, Calendar.first.id)
    get edit_calendar_holiday_url(Calendar.find_by(id: Holiday.last.calendar_id).invite_token, Holiday.last.slug)
    assert_response :success
  end

  test "should update holiday" do
    Holiday.last.update_attribute(:calendar_id, Calendar.first.id)
    get edit_calendar_holiday_url(Calendar.find_by(id: Holiday.last.calendar_id).invite_token, Holiday.last.slug)
    patch calendar_holiday_path(Holiday.last), params: { holiday: { calendar_id: Calendar.first.id, name: Holiday.last.name, date: Holiday.last.date, holiday_type: Holiday.last.holiday_type, slug: "test"} }
    assert_redirected_to calendar_path(Calendar.find_by(id: Holiday.last.calendar_id).invite_token)
  end

  test "should destroy holiday" do
    Holiday.create( { calendar_id: Calendar.first.id, name: "new_holiday2", date: Date.new(2022, 12, 7), holiday_type: "National", slug: "new_holiday2" } )
    @prev_calendar_id = Calendar.find_by(id: Holiday.last.calendar_id)
    Holiday.last.update_attribute(:calendar_id, Calendar.first.id)
    assert_difference("Holiday.count", -1) do
      delete calendar_holiday_path(Calendar.find_by(id: Holiday.last.calendar_id).invite_token, Holiday.last.slug)
    end

    assert_redirected_to calendar_path(@prev_calendar_id)
  end
end
