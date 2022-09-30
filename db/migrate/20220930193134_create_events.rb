class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :calendar_id
      t.integer :event_id
      t.string :event_category

      t.timestamps
    end
  end
end
