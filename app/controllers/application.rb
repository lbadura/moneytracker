# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include HoptoadNotifier::Catcher
  include AuthenticatedSystem
  helper :all # include all helpers, all the time

  before_filter :login_required

  protect_from_forgery :secret      => 'b8dc7f92da4ddf6b905be1084d47676cb4b0c1aca70ba1e9487678d99ca50a1e77a4e308918135566f4de7f37cf1522be2d5e727e3ba0d3bee02c7fc4044ad44'
  filter_parameter_logging :password

  # overwrite the access denied method to
  # redirect to a nicer url
  def access_denied
    alias new_session_path login_path
    super
  end

end
