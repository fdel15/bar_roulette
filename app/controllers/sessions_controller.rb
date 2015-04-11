class SessionsController < ApplicationController
  # before_action :logged_in?

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user == @user.where(password: params[:password])
      log_in(@user)
      render text: "You Logged in!"
    else
      render text: "Log in Failed!"
    end
  end

  end

  # def logged_in?


  # end

end
