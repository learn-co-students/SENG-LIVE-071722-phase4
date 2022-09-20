Rails.application.routes.draw do
  # get '/productions', to: "productions#index"
  # get '/productions/:id', to: "productions#show"
  # post '/productions', to: "productions#create"


  # it strictly follows REST pattern 
  # resources :productions, only: [:index, :show, :create, :update, :destroy]
  resources :productions

end
