Rails.application.routes.draw do
  root to: 'home#welcome'
  get 'movies/draft', to: 'movies#draft', as: :draft_movies
  get 'movies/:id/publish', to: 'movies#publish', as: :publish_movie
  resources :directors, only: [:show, :new, :create, :edit, :update, :index]
  resources :movies, only: [:show, :new, :create, :edit, :update, :index] 
  resources :genres, only: [:show, :new, :create, :edit, :update, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
