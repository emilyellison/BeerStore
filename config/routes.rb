BeerStore::Application.routes.draw do

  root to: 'beers#index'
  
  resources :beers
  resources :users, only: [ :new, :create, :show ]
  resources :cart_items, only: [ :create, :destroy ]
  
  get '/sign_in' => 'sessions#new', as: :sign_in
  post '/sign_in' => 'sessions#create'
  get '/sign_out' => 'sessions#destroy', as: :sign_out

end
