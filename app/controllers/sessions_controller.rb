class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:request_url] || root_path
      cookies[:request_url] = nil
    else
      flash.now[:alert] =  'Are you a Guru? Verify your email and password. You can! Lets Do It )'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :login
  end
end
