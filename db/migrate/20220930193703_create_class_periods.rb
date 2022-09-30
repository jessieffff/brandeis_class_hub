class CreateClassPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :class_periods do |t|
      t.integer :course_id
      t.string :individual_class_id
      t.string :integer
      t.string :start_time
      t.string :datetime
      t.string :end_time
      t.string :date_time

      t.timestamps
    end
  end
end
