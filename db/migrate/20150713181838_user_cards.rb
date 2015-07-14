class UserCards < ActiveRecord::Migration
  def change
    create_table :user_cards do |t|
      t.references :user
      t.references :card

      t.timestamps null: false
    end
  end
end
