require File.dirname(__FILE__) + '/../test_helper'

class AccountOperationTest < ActiveSupport::TestCase
  should_belong_to :account
  should_belong_to :user
end
