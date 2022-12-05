require "test_helper"

class HolidaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @holiday = holidays(:one)
  end


  test "should get new" do
    get new_holiday_url
    assert_response :success
  end

  test "should create holiday" do
    get new_holiday_url
    assert_difference("Holiday.count") do
      post holidays_url, params: { holiday: { calendar_id: Calendar.first.id, name: "Hanukkah", date: Date.new(2022, 10, 18), holiday_type: "Judaism" } }
    end
    assert_redirected_to holiday_url(Holiday.last)
  end

  test "should show holiday" do
    Holiday.last.update_attribute(:calendar_id, Calendar.first.id)
    get holiday_url(Holiday.last)
    assert_select "h3", "Christmas"
  end

  test "should get edit" do
    debugger
    get edit_calendar_holiday_url(@holiday)
    assert_response :success
  end

  test "should update holiday" do
    get edit_holiday_url @holiday
    patch holiday_url(@assignment), params: { holiday: { calendar_id: Calendar.first.id, name: @holiday.name, date: @holiday.date, holiday_type: @holiday.holiday_type, slug: "test"} }
    assert_redirected_to holiday_url(@holiday)
  end

  test "should destroy holiday" do
    assert_difference("Holiday.count", -1) do
      delete holiday_url(@holiday)
    end

    assert_redirected_to home_calendar_url
  end
end
