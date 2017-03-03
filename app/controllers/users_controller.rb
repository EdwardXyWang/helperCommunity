class UsersController < ApplicationController

  def new
  end

  def show
    @user = User.find(params[:id])
    @review =Review.new(:user=>@user, :reviewer=>current_user)
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo, :phone_number)
  end

end
