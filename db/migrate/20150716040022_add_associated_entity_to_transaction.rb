class AddAssociatedEntityToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :associated_entity, :string, :limit => 50
  end
end
