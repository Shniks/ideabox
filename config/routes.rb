Rails.application.routes.draw do
  resources :ideas
  resources :categories

  resources :users, only: [:new, :create, :show]

  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
