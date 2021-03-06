Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users" => "users#new"
  post "/users" => "users#create"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :providers, except: [:update, :edit, :destroy]

  get '/search' => 'providers#find'

  root "providers#search"


end
