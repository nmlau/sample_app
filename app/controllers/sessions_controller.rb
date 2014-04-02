class SessionsController < ApplicationController

  def new
  end

  def create
    #user = User.find_by(email: params[:session][:email].downcase)
    user = User.find_by(email: params[:email].downcase)
    #if user && user.authenticate(params[:session][:password])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    #session.delete(:return_to)
    redirect_to root_url
  end
end
