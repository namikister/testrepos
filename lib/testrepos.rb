require 'testrepos/menu_manager'

# Testrepos::MenuManager.map :top_menu do |menu|
#   menu.push :home, :home_path
#   menu.push :my_page, { :controller => 'my', :action => 'page' }, :if => Proc.new { User.current.logged? }
#   menu.push :projects, { :controller => 'projects', :action => 'index' }, :caption => :label_project_plural
#   menu.push :administration, { :controller => 'admin', :action => 'index' }, :if => Proc.new { User.current.admin? }, :last => true
#   menu.push :help, Testrepos::Info.help_url, :last => true
# end

# Testrepos::MenuManager.map :account_menu do |menu|
#   menu.push :login, :signin_path, :if => Proc.new { !User.current.logged? }
#   menu.push :register, { :controller => 'account', :action => 'register' }, :if => Proc.new { !User.current.logged? && Setting.self_registration? }
#   menu.push :my_account, { :controller => 'my', :action => 'account' }, :if => Proc.new { User.current.logged? }
#   menu.push :logout, :signout_path, :if => Proc.new { User.current.logged? }
# end

# Testrepos::MenuManager.map :application_menu do |menu|
#   # Empty
# end

Testrepos::MenuManager.map :admin_menu do |menu|
  # Empty
end

Testrepos::MenuManager.map :project_menu do |menu|
  menu.push :specification, { :controller => 'testprojects', :action => 'index' }
  menu.push :testplan, { :controller => 'testprojects', :action => 'show' }
  menu.push :result, { :controller => 'testprojects', :action => 'show' }
end
