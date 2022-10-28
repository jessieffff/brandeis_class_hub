class CreateOtherEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :other_events do |t|
      t.integer :calendar_id
      t.string :other_name
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
