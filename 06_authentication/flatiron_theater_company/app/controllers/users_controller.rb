class UsersController < ApplicationController
    def show 
        user = User.find(params[:id])
        render json: user, status: :ok
    end 

    # POST signup 
    def create 
        user = User.create(user_params)
        if user.valid? 
            # remember our user: the way that we are going to remember our user is through providing some information in the session hash and then sharing that session for every subsequent requests 
            session[:user_id] = user.id # => the step that we take to remember our user, the officical login 

            # session vs a cookie: sessions keep track of our users session: user login => user logout 
            # session is going to be secured by being stamped and encrypted even further 

            render json: user 
        else 
            render json: {error: "Signup attempt failed"}
        end
    end
    
    private 

    def user_params
        params.permit(:username, :email, :password)
    end 
end
