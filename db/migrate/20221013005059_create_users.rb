class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :google_token
      t.string :google_refresh_token
      t.timestamps
    end
  end
end
