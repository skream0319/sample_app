class UsersController < ApplicationController
  # GET users/:id
  def show
    @user = User.find(params[:id])
  end
  
  # GET users/new
  def new
    @user = User.new
  end
  
  #POST users (+ params)
  def create
   #Strong Parametersの実装  
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      #succes
      redirect_to @user
      # GET "/users/#{@user.id}"
    else
     render 'new'
      #failer
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
