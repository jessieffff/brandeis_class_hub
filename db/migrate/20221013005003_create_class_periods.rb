class CreateClassPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :class_periods do |t|
      t.integer :course_id
      t.string :name
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
