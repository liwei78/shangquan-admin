Admin::Application.routes.draw do

  resources :archetypes

  resource  :archetype_applies

  resources :banners

  resources :areas do
    member do
      get 'articles', 'archetypes'
    end
  end

  resources :categories do
    member do
      get 'articles', 'archetypes'
    end
  end

  mount Ckeditor::Engine => '/ckeditor'
  
  resources :users

  resources :articles do
    member do
      post 'del_pic'
    end
  end

  resources :activities

  resources :reports do
    collection do
      get 'channels', 'categories', 'areas'
    end
  end

  resources :channels do
    member do
      get 'articles', 'archetypes'
    end
  end

  resources :items
  
  match 'login'      => 'dashboard#login',      :as => :login,       :via => :get
  match 'checklogin' => 'dashboard#checklogin', :as => :checklogin,  :via => :post
  match 'logout'     => 'dashboard#logout',     :as => :logout,      :via => :get

  root :to => 'dashboard#index'
end
