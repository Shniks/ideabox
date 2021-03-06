class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User account created successfully!'
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:failure] = 'Account creation unsuccessful! Please try again.'
      render :new
    end
  end

  def show
    @user = User.find(params[:id]) #no need for @user as the view uses current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
