class AccountsController < ApplicationController
  def index
    @accounts = current_user.accounts(:order => "name ASC")
  end

  def new
    return render(:partial => 'accounts/new_account_form', :locals => {:update => false})
  end

  def destroy
    begin
      @account = Account.find(params[:id])
      @account.destroy
      render(:layout => false, :json => {:status => 200, :ok => true})
    rescue
      render(:layout => false, :json => {:status => 400, :ok => false})
    end
  end

  def create
    @account = Account.new(params[:account])
    @account.user = current_user
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

  def refresh
    @accounts = current_user.accounts(:order => "name ASC")
    return render(:partial => 'accounts/account_list')
  end

  def edit
    @account = Account.find_by_id params[:id] unless params[:id].nil? || params[:id].empty?
    return render(:partial => 'accounts/new_account_form', :locals => {:update => true})
  end

  def update
    Account.transaction do
      @account = Account.find_by_id(params[:id]) unless params[:id].nil? || params[:id].empty? 
      @account.update_attributes(params[:account])
    end
    return render(:json => {:ok => true, :status => 200})
  end
end
