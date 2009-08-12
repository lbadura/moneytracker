class RemoveIbanFromAccount < ActiveRecord::Migration
  def self.up
    remove_column(:accounts, :iban)
  end

  def self.down
    add_column(:accounts, :iban, :string, {:limit => 34, :null => true})
  end
end
