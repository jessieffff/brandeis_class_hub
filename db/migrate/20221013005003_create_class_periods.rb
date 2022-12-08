class CreateClassPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :class_periods do |t|
      t.integer :calendar_id
      t.integer :course_id
      t.string :name
      t.time :start_time
      t.time :end_time
      t.date :date
      t.timestamps
    end
  end
end
