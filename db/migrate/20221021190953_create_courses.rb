class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.integer :calendar_id
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :start_time
      t.string :end_time
      t.string :professor_name
      t.string :repetition_frequency
      
      t.timestamps
    end
  end
end
