ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require "rubygems"
require 'test_help'
require RAILS_ROOT + '/test/factories/user_factory'
require RAILS_ROOT + '/test/factories/account_factory'
require RAILS_ROOT + '/test/factories/account_operation_factory'

class ActiveSupport::TestCase
  include AuthenticatedTestHelper
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
