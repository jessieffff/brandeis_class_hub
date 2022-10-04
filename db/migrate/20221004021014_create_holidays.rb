class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.integer :event_id
      t.string :event_name
      t.string :event_category
      t.date :date
      t.string :holiday_type

      t.timestamps
    end
  end
end
