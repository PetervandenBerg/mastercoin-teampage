Teampage::Application.routes.draw do

  resources :newsitems

  devise_for :admins
  devise_for :users

  resources :resources
  resources :users

  resources :blogs do
    resources :comments
  end
 
  get "pages/home"
  get "pages/features"
  get "pages/contact"

  root 'pages#home'

end
