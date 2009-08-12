require File.dirname(__FILE__) + '/../test_helper'
require 'accounts_controller'
require 'json/add/rails'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class AccountsControllerTest < ActionController::TestCase

  def setup           
    @controller = AccountsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    I18n.locale = 'en'
    @account = Factory(:account)
    login_as :quentin
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
    post :destroy, :id => @account
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

  def test_creating_a_new_account
    post :create, :account => {:name => "test account",
      :number => "0987655432",
      :owner => "Czaja",
      :user_id => users(:quentin).id
    }
    response = JSON.parse(@response.body)
    assert_equal 200, response['status']
    assert_equal true, response['ok']
  end

  def test_creating_an_invalid_account
    post :create, :account => {:owner=> "lolo", :number => "001989837173"}
    response = JSON.parse(@response.body)
    assert_equal 400, response['status']
    assert_equal false, response['ok']
  end

  context "on get :refresh should refresh account list" do
    setup {get :refresh}
    should_respond_with :success
    should_assign_to :accounts
    should_render_template 'accounts/_account_list'
  end

  context "on get :edit should display the account edit form" do
    setup {get :edit, :id => @account.id}
    should_respond_with :success
    should_assign_to :account
    should_render_template 'accounts/_new_account_form.html.erb'
  end

  context "on put :update should update account and refresh list" do
    setup {put :update, {:id => @account.id, :name => "ziazia"}}
    should_respond_with :success
    should_assign_to :account
    should "return proper status" do
      response = JSON.parse(@response.body)
      assert_equal 200, response['status']
      assert_equal true, response['ok']
    end
  end

end