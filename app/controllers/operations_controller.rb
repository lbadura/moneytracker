class OperationsController < ApplicationController
  def index
    @operations = current_user.operations
  end
  
  def new
    render :text => 'New operation form will appear here'
  end
end
