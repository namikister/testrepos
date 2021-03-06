require 'testrepos/menu_manager'

Testrepos::MenuManager.map :top_menu do |menu|
  menu.push :home, { :controller => 'home', :action => 'index' }
  # menu.push :my_page, { :controller => 'my', :action => 'page' }, :if => Proc.new { User.current.logged? }
  menu.push :projects, { :controller => 'testprojects', :action => 'index' }
  # menu.push :administration, { :controller => 'admin', :action => 'index' }, :if => Proc.new { User.current.admin? }, :last => true
#  menu.push :help, Testrepos::Info.help_url, :last => true
  menu.push :help, { :controller => 'help', :action => 'index' }
end

Testrepos::MenuManager.map :account_menu do |menu|
#   menu.push :login, :signin_path, :if => Proc.new { !User.current.logged? }
#   menu.push :register, { :controller => 'account', :action => 'register' }, :if => Proc.new { !User.current.logged? && Setting.self_registration? }
#   menu.push :my_account, { :controller => 'my', :action => 'account' }, :if => Proc.new { User.current.logged? }
#   menu.push :logout, :signout_path, :if => Proc.new { User.current.logged? }
end

Testrepos::MenuManager.map :application_menu do |menu|
  # Empty
end

Testrepos::MenuManager.map :admin_menu do |menu|
  # Empty
end

Testrepos::MenuManager.map :project_menu do |menu|
  menu.push :overview, { :controller => 'testprojects', :action => 'show' }
  menu.push :specification, { :controller => 'specification', :action => 'show' }
  menu.push :testplan, { :controller => 'testplans', :action => 'show', :plan_id => 1 }
  menu.push :result, { :controller => 'testprojects', :action => 'show' }
end
