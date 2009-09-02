module AccountsHelper
  def account_controls(account)
    return if account.nil?
    render(:partial => 'accounts/account_controls', :locals => {:account => account})
  end
end
