Rails.application.routes.draw do
  get "gossips/show"
  
  get 'team', to: 'pages#team', as: 'team'

  get 'contact', to: 'pages#contact', as: 'contact'

  resources :gossips, only: [:show, :destroy]

  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
  
  get 'welcome/:first_name', to: 'pages#welcome', as: 'welcome'

  post 'publish', to: 'pages#publish', as: 'publish'

  root 'pages#welcome'

  get 'new', to: 'pages#new', as: 'new_potin'

  resources :gossips
end