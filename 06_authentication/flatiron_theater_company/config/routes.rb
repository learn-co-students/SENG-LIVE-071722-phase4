Rails.application.routes.draw do

  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :tickets, only: [:create]
  resources :users, only: [:show, :create]
  # resources :cast_members
  resources :productions, only: [ :index, :show, :create, :update, :destroy]


  

end
