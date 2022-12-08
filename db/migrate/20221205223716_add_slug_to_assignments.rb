class AddSlugToAssignments < ActiveRecord::Migration[7.0]
  def change
    add_column :assignments, :slug, :string
    add_index :assignments, :slug, unique: true
    add_index :assignments, :name, unique: true
  end
end
