Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :resources, only: [:index]
      resources :recipes, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :favorites, only: [:create]
    end
  end
end
