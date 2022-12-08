require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  # Log in as a particular user.
  def log_in_as(user, password: 'password')
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_button "Log in"
  end
end
