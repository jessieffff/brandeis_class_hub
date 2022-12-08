class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.integer :calendar_id
      t.string :name
      t.date :due_date
      t.time :due_time
      t.integer :course_id

      t.timestamps
    end
  end
end
