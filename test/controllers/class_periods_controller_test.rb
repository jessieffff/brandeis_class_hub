require "test_helper"

class ClassPeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @class_period = class_periods(:one)
    @class_period.update_attribute(:course_id, Course.first.id)
    @class_period.update_attribute(:calendar_id, Calendar.first.id)
  end

  test "should show class_period" do
    ClassPeriod.last.update_attribute(:course_id, Course.first.id)
    ClassPeriod.last.update_attribute(:calendar_id, Calendar.first.id)
    get calendar_course_class_period_path(Calendar.find_by(id: ClassPeriod.last.calendar_id).invite_token, 
                                          Course.find_by(id: ClassPeriod.last.course_id).slug, ClassPeriod.last.id)
    assert_select "h3", "COSCI_CLASS"
  end

  test "should get edit" do
    get edit_calendar_course_class_period_path(Calendar.find_by(id: ClassPeriod.last.calendar_id).invite_token,
                                               Course.find_by(id: ClassPeriod.last.course_id).slug, ClassPeriod.last.id)
    assert_response :success
  end

  test "should update class_period" do
    set_cal_and_course
    get edit_calendar_course_class_period_url(Calendar.find_by(id: ClassPeriod.last.calendar_id).invite_token, 
    Course.find_by(id: ClassPeriod.last.course_id).slug, ClassPeriod.last.id)
    patch calendar_course_class_period_url(Calendar.find_by(id: ClassPeriod.last.calendar_id).invite_token, 
                                            Course.find_by(id: ClassPeriod.last.course_id).slug, ClassPeriod.last.id),
                                            params: {class_period: {name: "new_assignment3"}}
    assert_redirected_to calendar_course_class_period_path(Calendar.find_by(id: ClassPeriod.last.calendar_id).invite_token,
                                                           Course.find_by(id: ClassPeriod.last.course_id).slug, ClassPeriod.last.id)
  end

  test "should destroy class_period" do
    set_cal_and_course
    prev_calendar_id = Calendar.find_by(id: @class_period.calendar_id)
    assert_difference("ClassPeriod.count", -1) do
      delete calendar_course_class_period_url(Calendar.find_by(id: ClassPeriod.last.calendar_id).invite_token,
                                              Course.find_by(id: ClassPeriod.last.course_id).slug, ClassPeriod.last.id)
    end

    assert_redirected_to calendar_path(prev_calendar_id)
  end

  private

    def set_cal_and_course
      ClassPeriod.last.update_attribute(:course_id, Course.first.id)
      ClassPeriod.last.update_attribute(:calendar_id, Calendar.first.id)
    end
end
