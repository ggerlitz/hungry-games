Rails.application.routes.draw do

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'

  resources :restaurants do
  	resources :events, shallow: true do
  		member do
  			post 'join'
  		end
  	end
  end

  resources :users
  root 'restaurants#index'
end
