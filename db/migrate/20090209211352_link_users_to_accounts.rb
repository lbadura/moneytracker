class LinkUsersToAccounts < ActiveRecord::Migration
  def self.up
    Account.delete_all();
    add_column :accounts, :user_id, :integer, :null => false
  end

  def self.down
    remove_column(:accounts, :user_id)
  end
end
