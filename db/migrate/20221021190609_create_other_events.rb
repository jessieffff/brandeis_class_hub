class CreateOtherEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :other_events do |t|
      t.integer :calendar_id
      t.string :name
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
