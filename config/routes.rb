Rails.application.routes.draw do
  root 'top#index'
  resources :reservations do
    collection do
      post 'confirm'
    end
    member do
      patch 'edit_confirm'
    end
  end
  
  get "rooms/own" => "rooms#own"
  resources :rooms
  get "/search" => "rooms#search"
  
  devise_for :users
  
  devise_scope :user do
    get '/users', to: redirect("/users/sign_up")
  end
  
  get "users/account" => "users#account"
  get "users/profile" => "users#profile"
  resource :profile,only: %i[edit update]
end