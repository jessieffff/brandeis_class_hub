class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.integer :calendar_id
      t.string :name
      t.datetime :due_date
      t.integer :course_id

      t.timestamps
    end
  end
end
