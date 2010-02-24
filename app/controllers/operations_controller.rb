class OperationsController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        @operations = current_user.operations
      end
      format.json do
        return render :json => current_user.operations.to_json
      end
    end
  end
  
  def new
    render :text => 'New operation form will appear here'
  end
end
