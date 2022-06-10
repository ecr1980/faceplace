Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'  
    delete 'sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "profiles/show/:id" => "profiles#show", as: "user_show"
  put "profiles/" => "profiles#update"
  resources :users, :friendships, :sayings, :likes, :comments, :profiles, :photos
  # Defines the root path route ("/")
  root "home#index"
  post "profiles/show/:id" => "profiles#create"

  #match "auth/:provider/callback", to: "sessios#create", via: [:get, :post]
  #match "auth/failure", to: redirect('/'), via: [:get, :post]
  #match "signout", to: "sessions#destroy", as: "signout", via: [:get, :post]
  
end
