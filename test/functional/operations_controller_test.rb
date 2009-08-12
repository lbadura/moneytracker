require File.dirname(__FILE__) + '/../test_helper'
require 'operations_controller'

class OperationsControllerTest < ActionController::TestCase
  def setup
      @user = Factory.create(:user, :login => 'operatio')
      @request = ActionController::TestRequest.new
      @response = ActionController::TestResponse.new
      login_user @user
  end

  context "on get to new" do
    setup do
      get :new
    end
    should_respond_with :success
  end
end
