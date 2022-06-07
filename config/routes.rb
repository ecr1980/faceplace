Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "profiles/show/:id" => "profiles#show", as: "user_show"
  resources :users, :friendships, :sayings, :likes, :comments, :profiles
  # Defines the root path route ("/")
  root "home#index"
  post "profiles/show/:id" => "profiles#create"
  
end
