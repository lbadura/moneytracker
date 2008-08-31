class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.column :name, :string, :null => false
      t.column :number, :string, :limit => 60, :null => false
      t.column :iban, :string, :limit => 34, :null => true
      t.column :owner, :string, :null => true
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
