class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :category
      t.decimal :credit_limit
      t.date :exp_date
      t.integer :cvv
      t.references :user

      t.timestamps null: false
    end
  end
end
