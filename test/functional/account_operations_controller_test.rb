require 'test_helper'

class AccountOperationsControllerTest < ActionController::TestCase
  context "post on new" do
    setup do
      @account = Factory(:account).build
    end
  end
end
