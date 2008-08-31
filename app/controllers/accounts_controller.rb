class AccountsController < ApplicationController
  expose :get, :index
  def index
    @accounts = Account.find(:all, :order => "name ASC")  
  end

  expose :get, :new
  def new
    return render(:partial => 'accounts/new_account_form')
  end
end
