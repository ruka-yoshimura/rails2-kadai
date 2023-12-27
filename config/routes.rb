Rails.application.routes.draw do
  get "rooms/own" => "rooms#own"
  delete  'rooms/:id'  => 'rooms#destroy'
  resources :rooms
  resources :reservations do
    collection do
      post 'confirm'
      patch 'confirm'
    end
  end
  # resources :rooms, only: [:create, :destroy]
  # end
  get "search" => "rooms#search"
  resource :profile,only: %i[show edit update]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'top#index'
  devise_scope :user do
    get 'users/index'
    get '/users/sign_in' => 'devise/sessions#new'
    get '/users/sign_up' => 'devise/registrations#new'
    get '/users', to: redirect("/users/sign_up")
  end
  get "users/profile" => "users#profile"
  get "users/account" => "users#account"
  get "users/account" => "users#account"
  get "/users" => "users#edit"
  get "/users" => "users#update"
  # get "/rooms" => "rooms#index"
  # get "rooms/new" => "rooms#new"
  # get "rooms/new" => "rooms#create"
  # get "rooms/create" => "rooms#create"
  # post "rooms", to: "rooms#create"
  # post "rooms/new" => "rooms#new"
  # get "rooms/own" => "rooms#own"
  # get "rooms/own" => "rooms#create"
  # get "rooms/own" => "rooms#own"
  # get "/users" => "users#update"
  
  # resources :users
    # sessions: "users/sessions",
    # registrations: "users/registrations"
  
  # マイページのルーティング
  # get 'users/:id/profile', to: 'users#show', as: 'user_profile'
end
