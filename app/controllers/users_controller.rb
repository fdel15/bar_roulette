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
    p '*'*100
    p params
    coordinates = params[:coordinates]
    @bar = retrieve_bar(coordinates)
    @address = bar_address
    @image = bar_image
    @rating = bar_rating_image
    @status = bar_status
    @name = bar_name
    render 'hopbar.html.erb'
  end
  private
    def user_params
        params.require(:user).permit(:email, :password, :_id)
    end



  def test
    coordinates = { latitude: 37.7577, longitude: -122.4376 }
    @bar = retrieve_bar(coordinates)
    @address = bar_address
    @image = bar_image
    @rating = bar_rating_image
    @status = bar_status

    result = [@address, @image, @rating, @status]
    # result = @bar


   render text: result
  end

  private

  def miles_to_meters(miles)
    miles * 1609.34
  end

end