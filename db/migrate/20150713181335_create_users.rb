class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username 
      t.string :password 
      t.string :email 
      t.string :phone 
      t.string :firstname
      t.string :lastname

      t.timestamps null: false
    end
  end
end
