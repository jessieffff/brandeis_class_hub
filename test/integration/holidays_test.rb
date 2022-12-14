require "test_helper"

class HolidaysTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "need holiday name" do
    get new_holiday_url
    assert_no_difference("Holiday.count") do
        post holidays_url, params: { holiday: { calendar_id: Calendar.first.id, date: Date.new(2022, 12, 7), holiday_type: "National", slug: "new_holiday" }}
    end
    assert_select "li", "Name can't be blank"
    assert_response :unprocessable_entity
    assert_template 'holidays/new'
  end

  test "need holiday date" do
    get new_holiday_url
    assert_no_difference("Holiday.count") do
        post holidays_url, params: { holiday: { calendar_id: Calendar.first.id, name: "Thingy", holiday_type: "National", slug: "new_holiday" }}
    end
    assert_select "li", "Date can't be blank"
    assert_response :unprocessable_entity
    assert_template 'holidays/new'
  end

  test "need holiday type" do
    get new_holiday_url
    assert_no_difference("Holiday.count") do
        post holidays_url, params: { holiday: { calendar_id: Calendar.first.id, name: "Thingy", date: Date.new(2022, 12, 7), slug: "new_holiday" }}
    end
    assert_select "li", "Holiday type can't be blank"
    assert_response :unprocessable_entity
    assert_template 'holidays/new'
  end



end