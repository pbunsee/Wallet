class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :number
      t.string :acctype
      t.decimal :balance, :default => 0.0

      t.timestamps null: false

      t.index :number
    end
  end
end
