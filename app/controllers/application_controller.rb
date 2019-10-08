class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      request_url
      redirect_to login_path
    end
    cookies[:email] = current_user&.email
    cookies[:id] = current_user&.id
  end

  def current_user
   @current_user ||=  User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def request_url
    cookies[:request_url] = request.url
  end
end
