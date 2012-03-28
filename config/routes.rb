Admin::Application.routes.draw do

  resources :banners

  resources :areas

  resources :categories

  mount Ckeditor::Engine => '/ckeditor'
  
  resources :users do
    
  end
  resources :articles do
    member do
      post 'del_pic'
    end
  end
  resources :companies
  resources :activities
  resources :brands
  resources :items
  
  match 'login'      => 'dashboard#login',      :as => :login,       :via => :get
  match 'checklogin' => 'dashboard#checklogin', :as => :checklogin,  :via => :post
  match 'logout'     => 'dashboard#logout',     :as => :logout,      :via => :get

  root :to => 'dashboard#index'
end
