Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get '/external/books', to: 'books#external'
  delete '/logout', to: 'sessions#destroy'
  resources "users"
  resources "groups"
  resources "books"
end
