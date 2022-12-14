require "test_helper"

class CalendarsTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)

    @class_period = class_periods(:one)
    @class_period.update_attribute(:calendar_id, Calendar.first.id)
    @class_period.update_attribute(:course_id, Course.first.id)
  end

  test "end time must be after start time" do
    get edit_calendar_course_class_period_url(Calendar.find_by(id: ClassPeriod.last.calendar_id).invite_token, 
                                              Course.find_by(id: ClassPeriod.last.course_id).slug, ClassPeriod.last.id)
    
    patch calendar_course_class_period_url(Calendar.find_by(id: ClassPeriod.last.calendar_id).invite_token, 
                                           Course.find_by(id: ClassPeriod.last.course_id).slug, ClassPeriod.last.id),
                                            params: {class_period: {start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 3, 0, 0)}}
    assert_select "li", "End time must be after Start time"
    assert_response :unprocessable_entity
    assert_template 'class_periods/edit'
    end

end