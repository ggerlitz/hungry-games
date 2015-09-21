Rails.application.routes.draw do

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'

  resources :restaurants
  resources :users
  root 'restaurants#index'
end
