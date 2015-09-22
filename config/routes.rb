Rails.application.routes.draw do

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  get 'cuisine', to: 'restaurants#search'
  get 'cuisines/:cuisine', to: 'restaurants#cuisine', as: 'cuisine_name'

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
