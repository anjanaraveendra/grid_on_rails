GridOnRails::Application.routes.draw do
  root :to => 'admin#index'
  match "admin/data", :to => "admin#data", :as => "data", :via => 'get'
  match "admin/db_action", :to => "admin#db_action", :as => "db_action", :via => 'get'
end
