Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :recipes
  resources :recipe_foods
  get 'public_recipes' => 'home#index'
  get 'public_recipes/:id' => 'home#show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :foods
  resources :users
end
