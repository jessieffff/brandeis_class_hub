require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  # Log in as a particular user.
  def log_in_as(user, password: 'password')
    visit login_url
    fill_in "Enter your email", with: user.email
    fill_in "Enter your password", with: password
    click_button "Log in", wait: 3
  end

  def wait
    sleep 20
  end
end
