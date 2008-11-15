# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def main_menu()
      base = [
        ['Accounts', {:controller => 'accounts', :action => 'index'}],
      ]
      
      use = base
          
      use.map{|x| "<li>#{link_to(h(x.first), x.last)}</li>"}.join('')
  end
end
