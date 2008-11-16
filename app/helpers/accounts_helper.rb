module AccountsHelper
  def account_number(account)
    return number = account.iban.empty? ? account.number : account.iban
  end

  def account_controls(account)
    return if account.nil?
    render(:partial => 'accounts/account_controls', :locals => {:account => account})
  end
end
