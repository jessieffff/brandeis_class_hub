require "test_helper"

class CoursesTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
  end

  test "need name" do
    get new_course_url
    assert_no_difference("Course.count") do
      post courses_url, params: { course: { calendar_id: Calendar.first.id, start_date: Date.new(2022, 12, 7), end_date: Date.new(2023, 2, 7),
                                            start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0),
                                            professor_name: "Steve", repetition_frequency: "MW", slug: "new_course" } }
    end

    assert_select "li", "Name can't be blank"
    assert_response :unprocessable_entity
    assert_template 'courses/new'
  end

  test "need calendar" do
    get new_course_url
    assert_no_difference("Course.count") do
      post courses_url, params: { course: {name: "Test thingy", start_date: Date.new(2022, 12, 7), end_date: Date.new(2023, 2, 7),
                                           start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0),
                                           professor_name: "Steve", repetition_frequency: "MW", slug: "new_course" } }
    end

    assert_response :unprocessable_entity
    assert_select "li", "Calendar can't be blank"
    assert_template 'courses/new'
  end

  test "need start date" do
    get new_course_url
    assert_no_difference("Course.count") do
      post courses_url, params: { course: {calendar_id: Calendar.first.id, name: "Test thingy", end_date: Date.new(2023, 2, 7),
                                           start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0),
                                           professor_name: "Steve", repetition_frequency: "MW", slug: "new_course" } }
    end

    assert_response :unprocessable_entity
    assert_select "li", "Start date can't be blank"
    assert_template 'courses/new'
  end

  test "need end date" do
    get new_course_url
    assert_no_difference("Course.count") do
      post courses_url, params: { course: {calendar_id: Calendar.first.id, name: "Test thingy", start_date: Date.new(2023, 2, 7),
                                           start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), end_time: Time.zone.local(2000, 1, 1, 12, 0, 0),
                                           professor_name: "Steve", repetition_frequency: "MW", slug: "new_course" } }
    end

    assert_response :unprocessable_entity
    assert_select "li", "End date can't be blank"
    assert_template 'courses/new'
  end

  test "need start time" do
    # get new_course_url
    # assert_no_difference("Course.count") do
    #     post courses_url, params: { course: {calendar_id: Calendar.first.id, name: "Test thingy", start_date: Date.new(2023, 2, 7), end_date: Date.new(2023, 4, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0), professor_name: "Steve", repetition_frequency: "MW", slug: "new_course" } }
    # end
    #assert_select "li", "Start time can't be blank"
    #assert_response :unprocessable_entity
    #assert_template 'courses/new'
  end

#   test "need end time" do
#     get new_course_url
#     assert_no_difference("Course.count") do
#       post courses_url, params: { course: { calendar_id: Calendar.first.id, name: "Test thingy 2", start_date: Date.new(2022, 12, 7), end_date: Date.new(2023, 2, 7), start_time: Time.zone.local(2000, 1, 1, 12, 0, 0), professor_name: "Steve", repetition_frequency: "MW", slug: "new_course" } }
#     end

#     assert_select "li", "End time can't be blank"
#     assert_response :unprocessable_entity
#     assert_template 'courses/new'
#   end

  test "need professor name" do
    get new_course_url
    assert_no_difference("Course.count") do
        post courses_url, params: { course: {calendar_id: Calendar.first.id, name: "Test thingy", start_date: Date.new(2023, 2, 7), 
                                             end_date: Date.new(2023, 4, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0),
                                             end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), repetition_frequency: "MW", slug: "new_course" } }
    end
    assert_select "li", "Professor name can't be blank"
    assert_response :unprocessable_entity
    assert_template 'courses/new'
  end

  test "need repetition frequency name" do
    get new_course_url
    assert_no_difference("Course.count") do
        post courses_url, params: { course: {calendar_id: Calendar.first.id, name: "Test thingy", start_date: Date.new(2023, 2, 7),
                                             end_date: Date.new(2023, 4, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0),
                                             end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), slug: "new_course" } }
    end
    assert_select "li", "Repetition frequency can't be blank"
    assert_response :unprocessable_entity
    assert_template 'courses/new'
  end

  test "must end time after start time" do
    get new_course_url
    assert_no_difference("Course.count") do
        post courses_url, params: { course: {calendar_id: Calendar.first.id, name: "Test thingy", start_date: Date.new(2023, 2, 7),
                                             end_date: Date.new(2023, 1, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0),
                                             end_time: Time.zone.local(2000, 1, 1, 12, 0, 0), repetition_frequency: "MW", slug: "new_course" } }
    end
    assert_select "li", "End date must be after Start date"
    assert_response :unprocessable_entity
    assert_template 'courses/new'
  end

  test "must end date after start date" do
    get new_course_url
    assert_no_difference("Course.count") do
        post courses_url, params: { course: {calendar_id: Calendar.first.id, name: "Test thingy", start_date: Date.new(2023, 2, 7),
                                             end_date: Date.new(2023, 5, 7), start_time: Time.zone.local(2000, 1, 1, 10, 0, 0),
                                             end_time: Time.zone.local(2000, 1, 1, 4, 0, 0), repetition_frequency: "MW", slug: "new_course" } }
    end
    assert_select "li", "End time must be after Start time"
    assert_response :unprocessable_entity
    assert_template 'courses/new'
  end
end
