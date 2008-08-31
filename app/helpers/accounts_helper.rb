module AccountsHelper
  def account_number(account)
    return number = account.iban.nil? ? account.number : account.iban
  end
end
