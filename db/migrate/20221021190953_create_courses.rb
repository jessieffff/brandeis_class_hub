class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.integer :calendar_id
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :professor_first_name
      t.string :professor_last_name
      t.string :repetition_frequency
      t.string :url

      t.timestamps
    end
  end
end
