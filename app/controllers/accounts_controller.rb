class AccountsController < ApplicationController
  expose :get, :index
  def index
    @accounts = Account.find(:all, :order => "name ASC")  
  end

  expose :get, :new
  def new
    return render(:partial => 'accounts/new_account_form')
  end

  expose :post, :create
  def create
    @account = Account.new(params[:account])
    if @account.valid? then
      @account.transaction do
        @account.save
        render(:json => {:status => 200})
      end
    else
      render(:nothing => true, :status => 400)
    end
  end
end
