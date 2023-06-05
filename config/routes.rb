Rails.application.routes.draw do
  get 'homepage/show'
  devise_for :users
  root to: "homepage#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :trips
end
