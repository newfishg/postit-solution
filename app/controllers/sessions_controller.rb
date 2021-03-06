class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you're logged in."
      redirect_to root_path
    else
      flash[:error] = 'There is something wrong with you username or password.'
      redirect_to login_path
    end

    user = User.find_by(username: params[:username])
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're logged out."
    redirect_to root_path
  end
end