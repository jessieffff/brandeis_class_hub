class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.integer :calendar_id
      t.string :holiday_name
      t.datetime :date
      t.string :holiday_type

      t.timestamps
    end
  end
end
