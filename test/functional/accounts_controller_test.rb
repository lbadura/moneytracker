require 'test_helper'
require 'accounts_controller'
require 'json'

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

  def test_deleting_an_account
    account = accounts(:first)
    post :destroy, :id => account.id
    response = JSON.parse(@response.body)
    assert_response :success
    assert_equal 200, response['status'] 
    assert_equal true, response['ok'] 
  end

  def test_deleting_an_nonexisting_account
    post :destroy, :id => nil
    response = JSON.parse(@response.body)
    assert_equal 400, response['status'] 
    assert_equal false, response['ok'] 
  end
end
