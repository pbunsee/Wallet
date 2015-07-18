class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description, :limit => 80
      t.decimal :amount
      t.string :currency, :limit => 3
      t.string :transaction_type, :limit => 50
      t.string :transaction_status, :limit => 50
      t.datetime :transaction_date 
      t.datetime :post_date 
      t.string :merchant
      t.references :account

      t.timestamps null: false
    end
  end
end
