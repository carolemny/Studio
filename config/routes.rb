Rails.application.routes.draw do
  resources :bookings
  root to: "spaces#index"
  resources :spaces
  resources :users, only: [:show, :edit, :update]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
