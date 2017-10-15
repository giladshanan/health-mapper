class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash.notice = "The email or password you entered was incorrect.  Please try again."
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end