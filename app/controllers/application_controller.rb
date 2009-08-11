# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include HoptoadNotifier::Catcher
  include AuthenticatedSystem
  helper :all # include all helpers, all the time

  before_filter :login_required

  protect_from_forgery
  filter_parameter_logging :password

  # overwrite the access denied method to
  # redirect to a nicer url
  def access_denied
    alias new_session_path login_path
    super
  end

end
