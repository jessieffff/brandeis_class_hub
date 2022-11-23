class AddCalendarToCalendarUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :user_calendars, :users
  end
end
