module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    session[:logged_in_using_omniauth].present?
  end

  # def logged_in_using_omniauth?
  #   session[:logged_in_using_omniauth].present?
  # end

  # Logs out the current user.
  def log_out
    reset_session
    @current_user = nil
  end
end
