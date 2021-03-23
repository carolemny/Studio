Rails.application.routes.draw do
  root to: "statics#landing_page"

  devise_for :users
  resources :join_space_categories, only: [:index]
  resources :categories, only: [:index]
  resources :contacts, only: [:new, :create]

  resources :spaces do
    resources :bookings
    resources :comments
  end
  
  resources :conversations do 
    resources :messages
  end 

  resources :users, only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
  end

  scope "/checkout" do
    resources :checkout, only: [:create]
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
    get "success", to: "checkout#success", as: "checkout_success"
  end

  get "statics/team"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end