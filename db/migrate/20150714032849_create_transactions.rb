class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :amount
      t.string :currency 
      t.datetime :transaction_date 
      t.datetime :post_date 
      t.string :from_account
      t.string :to_account
      t.references :account

      t.timestamps null: false
    end
  end
end
