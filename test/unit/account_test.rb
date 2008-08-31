require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def test_creating_an_account
    assert_difference 'Account.count' do
      create_account
    end
    assert_no_difference 'Account.count' do
      create_account(:name => "")
      create_account(:number => "")
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
