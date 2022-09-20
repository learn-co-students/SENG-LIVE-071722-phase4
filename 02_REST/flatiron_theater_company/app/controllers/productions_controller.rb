class ProductionsController < ApplicationController
    before_action :find_project, only: [:show, :update, :delete]

    # goal of this action is to return a list of resources

    # GET '/productions'
    def index 
        render json: Production.all
    end 

    # show action that is going to return a single production resource provided an id in the path 

    # GET 'productions/:id'
    # :id is dynamic 
    # params is a hash that gets populated at 2 different times: 1st is when we have dynamic routes, 2nd is when we have incoming data from the client side
    def show 

        # params[:id]

        # # how do I return the production with the id of 1
        render json: @production 


        # but what happens on the negative: is what if the production does not exist 

        # when use .find, we raise an exception and we handle exceptions differently (before/rescue statement)

        # rescue ActiveRecord::RecordNotFound => error
        #     render json: { error: error.message}
        # production = Production.find_by(id: params[:id])

        # if production 
        #     render json: production 
        # else 
        #     render json: { error: "That item does not exist"}
        # end
    end

    # POST '/productions'
    def create 
        # how do i access all the form data
        # how do I create a new production using that form data
        production = Production.create(production_params)
        render json: production
    end

    # PATCH '/productions/:id'
    def update
        @production.update(production_params)
        render json: @production
    end 

    # DELETE '/productions/:id'

    def destroy 
        @production.destroy
    end

    private 

    def find_production 
        @production = Production.find(params[:id])
    end

    def production_params 
        params.permit(:genre, :director, :budget, :title, :image, :description, :ongoing)
    end


end
