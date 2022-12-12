require "test_helper"

class UserCalendarTest < ActiveSupport::TestCase

  def setup
  @user_calendar = UserCalendar.new(calendar_id: Calendar.first.id,
                                    user_id: User.first.id, creator: true)

  end
  
  test "need calendar id" do
    @user_calendar.calendar_id = "      "
    assert_not @user_calendar.valid?
  end

  test "need user id" do
    @user_calendar.user_id = "      "
    assert_not @user_calendar.valid?
  end
end
