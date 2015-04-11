class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in(@user)
        format.html { render text: "#{current_user}", notice: 'user was successfully created.' }
        format.json { render text: 'no', status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
      params.require(:user).permit(:email, :password)
  end

end