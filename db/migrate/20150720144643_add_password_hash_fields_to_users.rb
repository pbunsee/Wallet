class AddPasswordHashFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_salt, :text
    add_column :users, :password_hash, :text
  end
end
