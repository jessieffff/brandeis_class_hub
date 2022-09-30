class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.integer :event_id
      t.string :event_name
      t.string :event_category
      t.datetime :due_date
      t.integer :class_id

      t.timestamps
    end
  end
end
