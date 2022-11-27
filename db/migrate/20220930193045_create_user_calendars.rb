class CreateUserCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :user_calendars do |t|
      t.integer :user_id
      t.integer :calendar_id
      t.boolean :creator, default: false, null: false
      
      t.timestamps
    end
    add_index :user_calendars, [:user_id, :calendar_id], unique: true

  end
end
