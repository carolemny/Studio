Rails.application.routes.draw do
  root to: "spaces#index"
  devise_for :users
  resources :join_space_categories, only: [:index]
  resources :categories, only: [:index]
  resources :bookings
  resources :contacts, only: [:new, :create]
  resources :spaces
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
