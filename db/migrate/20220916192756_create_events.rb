class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :content
      t.integer :event_id
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time
      t.text :location
      t.text :category

      t.timestamps
    end
  end
end
