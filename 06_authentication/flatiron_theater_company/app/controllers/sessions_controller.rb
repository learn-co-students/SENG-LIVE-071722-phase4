class SessionsController < ApplicationController
  
  # /login action
  def create

    # we need to first figure out if our user exists 

    user = User.find_by(username: params[:username])

    # if user && user.authenticate(params[:password])
    if user&.authenticate(params[:password])
    # once we confirm that the user exist, we need to make sure tehy gave us teh correct password: authenticate


    # officially log in our user: setting the session 
    session[:user_id] = user.id
    render json: user 
    else 
      render json: {error: "Invalid credentials, try again"}
    end 

  end


  # /logout action 
  def destroy
    session.delete :user_id

    # .delete is a method we can call on hashes 
    # goal: to forget the user, by removing their session 
  end
end
