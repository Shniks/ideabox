Rails.application.routes.draw do
  resources :ideas
  resources :categories

  resources :users, only: [:new]

  root "welcome#index"
end
