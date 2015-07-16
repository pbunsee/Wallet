class CreateUserCards < ActiveRecord::Migration
  def change
    create_table :user_cards do |t|
      t.references :user
      t.references :card

      t.timestamps null: false

      t.index [:card_id, :user_id]   
    end
  end
end
