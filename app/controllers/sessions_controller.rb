class SessionsController < ApplicationController
  # before_action :logged_in?

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    p params
    p @user.password
    if @user && @user.password == params[:password]
      log_in(@user)
      render text: "You Logged in!"
    else
      render text: "Log in Failed!"
    end
  end

  def destroy
    session[:user_id] = nil
    render text: "Logged out...for now"
  end

end
