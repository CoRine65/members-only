Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :posts, only: [ :index, :create ]
  root "posts#index"
end
