require "test_helper"

class GeneralTest < ActiveSupport::TestCase
  def format_test
    num = 1
    assert_equal(General.format(num), "01")
    num = 14
    assert_equal(General.format(num), "14")
  end
end