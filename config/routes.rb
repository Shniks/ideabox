Rails.application.routes.draw do
  resources :ideas
  resources :categories
  resources :images

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: [:index]
    resources :images, only: [:index]
  end

  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
