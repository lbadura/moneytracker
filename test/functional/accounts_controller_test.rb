require 'test_helper'
require 'accounts_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class AccountsControllerTest < Test::Unit::TestCase

  def setup           
    @controller = AccountsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    I18n.locale = 'en'
  end
  
  def test_index_action
    get :index
    assert_not_nil assigns["accounts"]
    assert_template('accounts/index.html.erb')
    assert_response :success
  end

  def test_rendering_new_account_form
    get :new
    assert_template('accounts/_new_account_form.html.erb')
    assert_select('input[type=button]') do
      assert_select '[value=Add]'
    end
    assert_response :success
  end
end
