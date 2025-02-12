Rails.application.routes.draw do

  # Définir les routes pour Devise (avec une personnalisation pour les inscriptions)
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Route pour la ville (elle pourrait être une page unique pour afficher les informations de la ville)
  resources :cities, only: [:show]
  
  # Route pour les utilisateurs
  resources :users, only: [:show]

  resources :gossips do
    resources :comments, only: [:create, :edit, :update]
  end
  
  # Autres pages du site
  root 'pages#welcome'
  get 'team', to: 'pages#team', as: 'team'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'welcome/:first_name', to: 'pages#welcome', as: 'welcome'
  
  # Route pour afficher le profil de l'utilisateur
  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'

  # Route pour publier un potin
  post 'publish', to: 'pages#publish', as: 'publish'

  # Routes pour les potins
  resources :gossips, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
