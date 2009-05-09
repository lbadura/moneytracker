class CreateAccountOperations < ActiveRecord::Migration
  def self.up
    create_table :account_operations do |t|
      t.integer :account_id, :null => false
      t.integer :user_id, :null => false
      t.date :datetime, :null => false
      t.string :title, :null => false
      t.decimal :amount, :precision => 8, :scale => 2, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :account_operations
  end
end
