class ProductionsController < ApplicationController


  # Build an endpoint that will return all production objects
  # the response should be in JSON 


  # the action

  def index 
    # first lets get all the productions from the db 
    # productions = Production.all 
    # render json: productions

    render json: Production.all
  end
end
