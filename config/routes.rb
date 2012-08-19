BeerStore::Application.routes.draw do

  root to: 'beers#index'

  resources :beers
  resources :users, only: [ :new, :create, :show ]

end
