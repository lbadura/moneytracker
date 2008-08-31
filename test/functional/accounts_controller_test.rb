require 'test_helper'
require 'accounts_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class AccountsControllerTest < Test::Unit::TestCase

  def setup           
    @controller = AccountsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
  def test_index
    get :index
    assert_not_nil assigns["accounts"]
    assert_response :success
  end
end
