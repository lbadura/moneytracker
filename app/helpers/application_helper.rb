# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def main_menu()
      base = [
        ['Accounts', {:controller => 'accounts', :action => 'index'}],
      ]
      
      use = base
      options = lambda {|x| @controller.class.to_s.downcase.gsub('controller','') == x.first.lowercase ? {:id => "current"} : nil }
          
      use.map{|x| "<li>#{link_to(h(x.first), x.last, &options)}</li>"}.join('')
  end
end
