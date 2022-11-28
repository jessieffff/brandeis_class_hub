class CreateOtherEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :other_events do |t|
      t.integer :calendar_id
      t.string :name
      t.string :start_time
      t.string :end_time
      t.date :date

      t.timestamps
    end
  end
end
