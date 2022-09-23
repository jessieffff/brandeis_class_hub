class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :assignment_id
      t.string :course

      t.timestamps
    end
  end
end
