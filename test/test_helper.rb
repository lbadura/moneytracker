ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require "rubygems"
require 'test_help'
require 'factory_girl'

class ActiveSupport::TestCase
  include AuthenticatedTestHelper
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
  fixtures :all

  def login_user(user)
    session[:user_id] = user[:id]
  end
end
