class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] =  'Are you a Guru? Verify your email and password. You can! Lets Do It )'
      render :new
    end
  end

  def delete
    session.destroy
    redirect_to :login
  end
end
