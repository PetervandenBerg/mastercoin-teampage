Teampage::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :messages do
    resources :comments
  end
  
  resources :notifications

  resources :newsitems do 
    resources :comments
  end

  devise_for :users

  resources :resources
  
  resources :users 

  resources :comments do
    resources :comments
  end

  resources :blogs do
    resources :comments do
      resources :comments
    end
  end


  get "contact/new"
  get "pages/home"
  get "pages/features"
  get "pages/contact"
  get "pages/teampage"

  root 'pages#home'

  match 'contact' => 'contact#new', :via => :get
  match 'contact' => 'contact#create', :via => :post

end
