Admin::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  resources :users
  resources :articles
  resources :companies
  resources :activities
  resources :brands
  resources :goods
  
  match 'login'      => 'dashboard#login',      :as => :login,       :via => :get
  match 'checklogin' => 'dashboard#checklogin', :as => :checklogin,  :via => :post
  match 'logout'     => 'dashboard#logout',     :as => :logout,      :via => :get

  root :to => 'dashboard#index'
end
