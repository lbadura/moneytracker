class AccountsController < ApplicationController
  expose :get, :index
  def index
    @accounts = Account.find(:all, :order => "name ASC")  
  end

  expose :get, :new
  def new
    return render(:partial => 'accounts/new_account_form')
  end

  expose [:post, :delete], :destroy
  def destroy
    @account = Account.find(params[:id])
    if @account.destroy then
      render(:layout => false, :json => {:status => 200, :ok => true})
    else
      render(:layout => false, :json => {:status => 400, :ok => false})
    end
  end

  expose :post, :create
  def create
    @account = Account.new(params[:account])
    if @account.valid? then
      @account.transaction do
        @account.save
        respond_to do |format|
          format.json {
            return render(:json => {:ok => true, :status => 200})
          }
        end
      end
    else
      respond_to do |format|
        format.json {
          return render(:json => {:ok => false, :errors => @account.errors, :status => 400})
        }
      end
    end
  end

  expose :get, :refresh
  def refresh
    @accounts = Account.find(:all, :order => "name ASC")  
    return render(:partial => 'accounts/account_list')
  end

end
