class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.string :calendar_name
      t.integer :user_id
      t.boolean :shared

      t.timestamps
    end
  end
end
