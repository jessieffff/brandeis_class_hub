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

end
