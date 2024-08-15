Rails.application.routes.draw do

  root "products#index"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users
  resources :products, only: [:index, :show]
  resource :cart, only: [:show, :destroy]
  resources :cart_items, only: [:create, :destroy]

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :products
  end

  # Defines the root path route ("/")
end
