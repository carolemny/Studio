Rails.application.routes.draw do
  root to: "statics#landing_page"
  get "statics/team"

  devise_for :users
  resources :contacts, only: [:new, :create]
  
  resources :spaces do
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:index]
  resources :join_space_categories, only: [:index]
  
  resources :conversations, only: [:show, :index] do 
    resources :messages, only: [:create]
  end 

  resources :users, only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
  end

  scope "/checkout" do
    resources :checkout, only: [:create]
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
    get "success", to: "checkout#success", as: "checkout_success"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end