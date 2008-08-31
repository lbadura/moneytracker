# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret      => 'b8dc7f92da4ddf6b905be1084d47676cb4b0c1aca70ba1e9487678d99ca50a1e77a4e308918135566f4de7f37cf1522be2d5e727e3ba0d3bee02c7fc4044ad44'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
