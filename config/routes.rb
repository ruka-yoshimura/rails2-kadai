Rails.application.routes.draw do
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
    get "users/profile/edit" => "users#edit"
    get "users/profile/edit" => "users#update"
    get "users/account" => "users#account"
    get "users/account" => "users#account"
    get "/users" => "users#edit"
    get "/users" => "users#update"
    # get "rooms/index"
    get "rooms/new" => "rooms#new"
    # get "rooms/own" => "rooms#own"
    # get "/users" => "users#update"

  resources :users
  resource :profile,only: %i[show edit update]
    # sessions: "users/sessions",
    # registrations: "users/registrations"
  
  # マイページのルーティング
  # get 'users/:id/profile', to: 'users#show', as: 'user_profile'
end
