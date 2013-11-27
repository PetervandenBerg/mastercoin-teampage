Teampage::Application.routes.draw do

  get "contact/new"
  resources :messages do
    resources :comments
  end
  
  resources :notifications

  resources :newsitems

  devise_for :admins
  devise_for :users

  resources :resources
  
  resources :users 

  resources :blogs do
    resources :comments do
      resources :comments
    end
  end


 
  get "pages/home"
  get "pages/features"
  get "pages/contact"
  get "pages/teampage"

  root 'pages#home'

  match 'contact' => 'contact#new', :via => :get
  match 'contact' => 'contact#create', :via => :post

end
