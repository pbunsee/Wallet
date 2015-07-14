class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :type
      t.decimal :balance
      t.references :user

      t.timestamps null: false
    end
  end
end
