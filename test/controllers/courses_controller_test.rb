require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest

  attr_accessor :course
  setup do
    @user = users(:one)
    log_in_as(@user)
    @course = courses(:one)
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create course" do
    get new_course_url
    assert_difference("Course.count") do
      post courses_url, params: { course: { calendar_id: Calendar.first.id, name: @course.name,
                                            start_date: @course.start_date, end_date: @course.end_date,
                                            start_time: @course.start_time, end_time: @course.end_time,
                                            professor_name: @course.professor_name, repetition_frequency: @course.repetition_frequency } }
    end
    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    Course.last.update_attribute(:calendar_id, Calendar.first.id)
    get course_url(Course.last)
    assert_select "h3", "COSCI_CLASS"
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    get edit_course_url @course
    patch course_url(@course), params: { course: { calendar_id: Calendar.first.id, name: @course.name,
                                                   start_date: @course.start_date, end_date: @course.end_date,
                                                   start_time: @course.start_time, end_time: @course.end_time,
                                                   professor_name: @course.professor_name, repetition_frequency: @course.repetition_frequency } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference("Course.count", -1) do
      delete course_url(@course)
    end

    assert_redirected_to home_calendar_url
  end
end
