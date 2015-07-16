class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :category
      t.decimal :credit_limit
      t.date :exp_date
      t.integer :cvv

      t.timestamps null: false

      t.index :number
    end
  end
end
