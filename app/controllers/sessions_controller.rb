class SessionsController < ApplicationController
  # before_action :logged_in?

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      log_in(@user)
      redirect_to @user
    else
      flash[:error] = "Login failed."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def createuber
    @auth_hash = request.env['omniauth.auth']
  end

end
