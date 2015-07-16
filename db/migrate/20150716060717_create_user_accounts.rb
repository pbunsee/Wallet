class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.references :user
      t.references :account

      t.timestamps

      t.index [:account_id, :user_id]
    end
  end
end
