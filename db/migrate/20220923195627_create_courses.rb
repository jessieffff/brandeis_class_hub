class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :professor_first_name
      t.string :professor_last_name
      t.string :name
      t.string :subject

      t.timestamps
    end
  end
end
