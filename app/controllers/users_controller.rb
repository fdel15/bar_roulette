class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: current_user)
  end

  def create
    params[:user][:_id] = params[:user][:email]
    check = User.find_by(_id: params[:user][:email])
    p '*'*50
    p check
    if check == nil
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save
            log_in(@user)
            format.html {  redirect_to @user, notice: 'user was successfully created.' }
            format.json { render text: 'no', status: :created, location: @user }
          else
            format.html {
              flash[:error] = "Failed to create user. (check email or password)"
              render :new
            }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    else
      flash[:error] = "Failed to create user. (check email or password)"
      redirect_to "/signup"
    end
  end

  def hopbar
    @initial_coordinates = params[:coordinates]
    @bar = retrieve_bar(@initial_coordinates)
    @address = bar_address
    @image = bar_image
    @rating = bar_rating_image
    @status = bar_status
    @name = bar_name
    @bar_description = bar_description
    render 'hopbar.html.erb'
  end

  def get_uber
    p "-"*100
    p params
    respond_to do |format|
      format.json{ render text:"200"}
      format.html{
        render text: "not supose to"
      }
    end
  end

  private
    def user_params
        params.require(:user).permit(:email, :password, :_id)
    end

    def miles_to_meters(miles)
      miles * 1609.34
    end

end