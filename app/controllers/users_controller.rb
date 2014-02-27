class UsersController < ApplicationController

  def new
    reset_session
    @user = User.new
  end



  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have created a new account."
    else
      flash[:alert] = "You were not signed up."
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
