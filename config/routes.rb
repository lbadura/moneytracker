ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'

  map.root :controller => "accounts"
  map.connect 'accounts/refresh', :controller => 'accounts', :action => 'refresh'

  # resources
  map.resources :users
  map.resources :operations, :only => :index
  map.resource :session
  map.resources :accounts do |account|
    account.resources :operations
  end


  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
