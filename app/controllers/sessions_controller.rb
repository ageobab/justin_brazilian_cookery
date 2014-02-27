class SessionsController < ApplicationController


  def new

  end


  def create
    @user = User.find_by(email: params[:email])
    if @user.try(:authenticate, params[:password])
      session[:current_user = @user]
      redirect_to root_path, :notice => "You made it. You're logged in."
    else
      flash[:error] = "You done messed up."
      render :new
    end

  end



  def logout
    reset_session
    redirect_to root_path, notice: "Logout Successful you buster."

  end


end
