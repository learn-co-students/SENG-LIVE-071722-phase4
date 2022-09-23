Rails.application.routes.draw do
 
  resources :tickets, only: [:show]
  resources :users, only: [:show]
  resources :cast_members, only: [:show]
  resources :productions, only: [ :index, :show, :create, :update, :destroy]
  # Custome Route 
 
  

end
