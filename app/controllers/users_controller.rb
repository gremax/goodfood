class UsersController < ApplicationController
  before_action :signed_in_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome aboard!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Form contains some errors"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                 :password_confirmation)
  end
end
