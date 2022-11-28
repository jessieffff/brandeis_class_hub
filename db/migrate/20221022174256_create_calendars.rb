class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      # t.string :calendar_name
      t.string :description
      t.string :name
      t.integer :user_id
      t.boolean :shared
      t.string :invite_token

      t.timestamps
    end
    add_index :calendars, :invite_token, unique: true
  end
end
