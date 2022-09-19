Rails.application.routes.draw do

  # routes: HTTP verb, endpoint, which controller action is going to handle that request

  get "/productions", to: "productions#index"

end
