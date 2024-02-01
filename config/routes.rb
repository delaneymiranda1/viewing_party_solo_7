Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'
  get '/users/:user_id/movies/:id', to: 'movies#show'
  get '/users/:user_id/movies/:id/viewing_parties/new', to: 'viewing_parties#new'

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show]
  end
end
