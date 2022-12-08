require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest

  attr_accessor :course
  setup do
    @user = users(:one)
    log_in_as(@user)
    @course = courses(:one)
    @course.update_attribute(:calendar_id, Calendar.first.id)
    @course_parameters = { calendar_id: Calendar.first.id, name: "new_course", start_date: Date.new(2022, 12, 7), end_date: Date.new(2023, 2, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), professor_name: "Steve", repetition_frequency: "MW", slug: "new_course" }
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    get new_course_url
    assert_difference("Course.count") do
      post courses_url, params: { course: @course_parameters }
    end
    assert_redirected_to calendar_course_path(Calendar.find_by(id: Course.last.calendar_id).invite_token, Course.last.slug)
  end

  test "should show course" do
    get calendar_course_path(Calendar.find_by(id: @course.calendar_id).invite_token, @course.slug)
    assert_select "h3", "COSCI_CLASS"
  end

  test "should get edit" do
    get edit_calendar_course_path(Calendar.find_by(id: @course.calendar_id).invite_token, @course.slug)
    assert_response :success
  end

  test "should update course" do
    Course.create( { calendar_id: Calendar.first.id, name: "new_course2", start_date: Date.new(2022, 12, 7), end_date: Date.new(2023, 2, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), professor_name: "Steve", repetition_frequency: "MW", slug: "new_course2" } )
    Course.last.update_attribute(:calendar_id, Calendar.first.id)
    get edit_calendar_course_path(Calendar.find_by(id: Course.last.calendar_id).invite_token, Course.last.slug)
    patch calendar_course_path(Course.last), params: { course: { calendar_id: Calendar.first.id, name: Course.last.name,
                                                   start_date: Course.last.start_date, end_date: Course.last.end_date,
                                                   start_time: Course.last.start_time, end_time: Course.last.end_time,
                                                   professor_name: Course.last.professor_name, repetition_frequency: Course.last.repetition_frequency, slug: @course.slug } }
    assert_redirected_to calendar_course_path(Calendar.find_by(id: Course.last.calendar_id).invite_token, Course.last.slug)
  end

  test "should destroy course" do
    assert_difference("Course.count", -1) do
      delete calendar_course_path(Calendar.find_by(id: @course.calendar_id).invite_token, @course.slug)
    end

    assert_redirected_to home_calendar_url
  end
end
