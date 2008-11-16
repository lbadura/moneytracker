module AccountsHelper
  def account_number(account)
    return number = account.iban.empty? ? account.number : account.iban
  end
end
