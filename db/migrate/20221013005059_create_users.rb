class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :student_id
      t.string :email
      t.string :google_id

      t.timestamps
    end
  end
end
