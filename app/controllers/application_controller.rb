class ApplicationController < ActionController::Base

  before_action :set_current_user

  include SessionsHelper

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_url, status: :see_other
    end
  end

  rescue_from ActiveRecord::RecordNotFound,    with: :route_not_found
  rescue_from ActionController::RoutingError,  with: :route_not_found
  rescue_from ActionController::UnknownFormat, with: :route_not_found

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
