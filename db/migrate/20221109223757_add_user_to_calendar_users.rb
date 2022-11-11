class AddUserToCalendarUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :user_calendars, :calendars
  end
end
