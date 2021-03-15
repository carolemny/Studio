Rails.application.routes.draw do
  resources :bookings
  root "spaces#index"
  resources :spaces
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
