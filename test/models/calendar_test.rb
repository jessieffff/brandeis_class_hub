require "test_helper"

class CalendarTest < ActiveSupport::TestCase
  def setup
    @calendar = Calendar.new(name: "example", user_id: User.first.id)
  end

  test "should be valid" do
    assert @calendar.valid?
  end

  test "name should be present" do
    @calendar.name = ""
    assert_not @calendar.valid?
  end

  test "user id should be present" do
    @calendar.user_id = ""
    assert_not @calendar.valid?
  end
end