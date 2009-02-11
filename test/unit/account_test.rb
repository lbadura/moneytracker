require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  should_belong_to :user
  
  def test_creating_an_account
    # Ensure new accounts can be created with default params
    assert_difference 'Account.count' do
      Factory(:account)
    end

    # Ensure no accounts are created without the nescessary params
    assert_no_difference 'Account.count' do
      create_account(:name => "")
      create_account(:number => "")
      create_account(:owner => "")
    end
  end

  protected
  def create_account(options = {})
    acc = Account.new({:name => 'Some name', 
                      :number => '111111111111111111111111', 
                      :iban => 'PL0011111111111111111111',
                      :owner => 'Lukasz'
    }.merge(options))
    acc.save
    return acc
  end
end
