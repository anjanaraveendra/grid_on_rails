GridOnRails::Application.routes.draw do
  get "articles/index"
  get 'admin/index'

  match "articles/data", :to => "articles#data", :as => "data", :via => 'get'
  match "articles/db_action", :to => "articles#db_action", :as => "db_action", :via => 'get'

  #root :to => 'articles#index'
  match "admin/data", :to => "admin#data", :as => "data", :via => 'get'
  match "admin/db_action", :to => "admin#db_action", :as => "db_action", :via => 'get'
end
