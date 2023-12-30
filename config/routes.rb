Rails.application.routes.draw do
  get "rooms/own" => "rooms#own"
  # delete  'rooms/:id'  => 'rooms#destroy'
  # delete  'reservations/:id'  => 'reservations#destroy'
  resources :rooms
  resources :reservations do
    collection do
      post 'confirm'
      patch 'confirm'
    end
    # member do
      #     patch 'edit_confirm'
    # end
  end
  get "/search" => "rooms#search"

  resource :profile,only: %i[show edit update]

  
  root 'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users/index'
    get '/users/sign_in' => 'devise/sessions#new'
    get '/users/sign_up' => 'devise/registrations#new'
    get '/users', to: redirect("/users/sign_up")
  end
 
  get "users/account" => "users#account"
  get "users/profile" => "users#profile"
end