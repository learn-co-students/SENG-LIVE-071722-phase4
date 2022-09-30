class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :authenticated_user # using this syntax means that authenticated user will run before ANY action runs 

    # we can also restrict the before action calls to specific actions using keywords like only and except 
    # before_action :authenticated_user, except: :create


    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    
    private
    
    # a method that says my user can't access these parts of my application untl they are logged in and authenticated 

    def authenticated_user
        # return a notice to our user that theyre not logged in and don't have access unless a current user does exist 
        render json: {errors: "Please login"}, status: :unauthorized unless current_user 
    end

    def is_authorized?
        permitted = current_user.admin? 
        # || item.user_id == current_user.id # will return a true or false value
        render json: {errors: "This user does not have permission"}, status: :forbidden unless permitted 
    end 

    def current_user

        # use the value stored in the session hash to return our user 

        @current_user ||= User.find_by_id(session[:user_id]) #memoization => optimizes how many times we query the db, the less often we do this the more optimal our application is/ imitating caching 
    end 

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end 

     def render_not_found(error)
        render json: {errors: {error.model => "Not Found"}}, status: :not_found
    end 
end


# private methods should contain so any methods that don't have a endpoint directly associated with them 

# all other methods defined in the controller (outside of the private methods scope) means that they have an associated endpoint