Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "home/show/:id" => "home#show", as: "user_show"
  resources :users, :friendships
  # Defines the root path route ("/")
  root "home#index"
  #post "friendships" => "friendships#create", as: "create_friendship"
end
