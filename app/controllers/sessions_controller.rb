class SessionsController < ApplicationController
  def new
  end
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
    # If user exists and password entered is correct
     # Save user id as cookie so they stay logged in
      session[:user_id] = user.id
      redirect_to '/'
    else 
      redirect_to '/login'
    end
    
  end

  def destroy
    # Remove the cookie
    session[:user_id] = nil
    redirect_to :root
  end
end