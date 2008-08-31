class AccountsController < ApplicationController
  expose :get, :index
  def index
    @accounts = Account.find(:all, :order => "name ASC")  
  end
end
