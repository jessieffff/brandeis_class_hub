require "test_helper"

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @assignment = assignments(:two)
    @assignment.update_attribute(:course_id, Course.first.id)
    @assignment.update_attribute(:calendar_id, Calendar.first.id)
    @assignment_parameters = { calendar_id: Calendar.first.id, name: "new_assignment", due_date: Date.new(2022, 12, 7), due_time: Time.zone.local(2000, 1, 1, 10, 0, 0), course_id: Course.first.id, slug: "new_assignment" }

  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create assignment" do
    get new_assignment_url
    assert_difference("Assignment.count") do
      post assignments_url, params: { assignment: @assignment_parameters }
    end
    assert_redirected_to calendar_course_assignment_path(Calendar.find_by(id: Assignment.last.calendar_id).invite_token, 
                                                        Course.find_by(id: Assignment.last.course_id).slug, Assignment.last.slug)
  end

  test "should show assignment" do
    set_assignment_cal_course
    get calendar_course_assignment_path(Calendar.find_by(id: Assignment.last.calendar_id).invite_token, 
    Course.find_by(id: Assignment.last.course_id).slug, Assignment.last.slug)
    assert_select "h3", "Test_Assignment"
  end

  test "should get edit" do
    set_assignment_cal_course
    get edit_calendar_course_assignment_path(Calendar.find_by(id: Assignment.last.calendar_id).invite_token, 
    Course.find_by(id: Assignment.last.course_id).slug, Assignment.last.slug)
    assert_response :success
  end

  test "should update assignment" do
    Assignment.create( {calendar_id: Calendar.first.id, name: "new_assignment2", due_date: Date.new(2022, 12, 8), due_time: Time.zone.local(2000, 1, 1, 10, 0, 0), course_id: Course.first.id } )
    set_assignment_cal_course
    get edit_calendar_course_assignment_url Calendar.find_by(id: Assignment.last.calendar_id).invite_token, 
                                            Course.find_by(id: Assignment.last.course_id).slug, Assignment.last.slug
    patch calendar_course_assignment_url(Calendar.find_by(id: Assignment.last.calendar_id).invite_token, 
                                         Course.find_by(id: Assignment.last.course_id).slug, Assignment.last.slug),
                                         params: {assignment: {name: "new_assignment3"}}
    assert_redirected_to cal_course_path_info
  end

  test "should destroy assignment" do
    Assignment.create( {calendar_id: Calendar.first.id, name: "new_assignment3", due_date: Date.new(2022, 12, 9), due_time: Time.zone.local(2000, 1, 1, 10, 0, 0), course_id: Course.first.id } )
    prev_cal_id = Calendar.find_by(id: Assignment.last.calendar_id)
    set_assignment_cal_course
    assert_difference("Assignment.count", -1) do
      delete cal_course_path_info
    end

    assert_redirected_to calendar_path(prev_cal_id)
  end

  def set_assignment_cal_course
    Assignment.last.update_attribute(:course_id, Course.first.id)
    Assignment.last.update_attribute(:calendar_id, Calendar.first.id)
  end

  def cal_course_path_info
    calendar_course_assignment_path(Calendar.find_by(id: Assignment.last.calendar_id).invite_token, 
                                    Course.find_by(id: Assignment.last.course_id).slug, Assignment.last.slug)
  end

end
