# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def main_menu()
      base = [
        [t(:accounts), {:controller => 'accounts', :action => 'index'}],
        [t(:operations), {:controller => 'operations', :action => 'index'}],
      ]
      
      base.map{|x| "<li>#{link_to(h(x.first), x.last)}</li>"}.join('')
  end
end
