Rails.application.routes.draw do

  root 'pages#welcome'
  
  resources :gossips, only: [:new, :create, :show, :index, :destroy]

  get 'team', to: 'pages#team', as: 'team'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'welcome/:first_name', to: 'pages#welcome', as: 'welcome'
  
  # Gestion des utilisateurs
  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'

  post 'publish', to: 'pages#publish', as: 'publish'

  
end
