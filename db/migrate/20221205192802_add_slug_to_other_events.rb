class AddSlugToOtherEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :other_events, :slug, :string
    add_index :other_events, :slug, unique: true
    add_index :other_events, :name, unique: true
  end
end
