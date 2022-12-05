require "test_helper"

class ClassPeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @class_period = class_periods(:one)
  end

  test "should show class_period" do
    ClassPeriod.last.update_attribute(:course_id, Course.first.id)
    ClassPeriod.last.update_attribute(:calendar_id, Calendar.first.id)
    get class_period_url(ClassPeriod.last)
    assert_select "h3", "COSCI_CLASS"
  end

  test "should get edit" do
    get edit_class_period_url(@class_period)
    assert_response :success
  end

  test "should update class_period" do
    get edit_class_period_url @class_period
    patch class_period_url(@class_period), params: { class_period: { calendar_id: Calendar.first.id, name: @class_period.name,
                                                     date: @class_period.date, start_time: @class_period.start_time,
                                                     end_time: @class_period.end_time, course_id: Course.first.id} }
    assert_redirected_to class_period_url(@class_period)
  end

  test "should destroy class_period" do
    assert_difference("ClassPeriod.count", -1) do
      delete class_period_url(@class_period)
    end

    assert_redirected_to home_calendar_url
  end
end
