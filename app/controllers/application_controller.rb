class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  def admin?
    current_user.admin == true
  end

  def advanced?
    current_user.advanced == true
  end

  helper_method :current_user
  helper_method :admin?
  helper_method :advanced?


  class AccessDenied < StandardError
  end

  rescue_from AccessDenied, with: :render_404

  def render_404
    render 'public/404', status: :not_found, layout: false
  end

  private

  def ensure_logged_in_user
    unless current_user
      redirect_to signin_path, notice: "Please sign in first"
    end
  end

  def current_user_notes
    notes_list = TastingNote.where(user_id: current_user.id).pluck(:id)
    @tasting_note = TastingNote.find(params[:id])
    unless admin? || notes_list.include?(@tasting_note.id)
      raise AccessDenied
    end
  end


end
