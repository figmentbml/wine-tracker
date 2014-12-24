class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  private

  def ensure_logged_in_user
    unless current_user
      redirect_to signin_path, notice: "Please sign in first"
    end
  end

end
