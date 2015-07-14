class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :category
      t.decimal :credit_limit
      t.integer :exp_mm
      t.integer :exp_yy
      t.integer :cvv

      t.timestamps null: false
    end
  end
end
