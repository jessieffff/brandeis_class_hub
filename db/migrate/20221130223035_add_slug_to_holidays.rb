class AddSlugToHolidays < ActiveRecord::Migration[7.0]
  def change
    add_column :holidays, :slug, :string
    add_index :holidays, :slug, unique: true
    add_index :holidays, :name, unique: true
  end
end
