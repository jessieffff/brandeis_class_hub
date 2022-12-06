class SessionsController < ApplicationController
  before_action :logged_in_user, only: %i[edit update]
  def new; end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to home_calendar_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end

  def googleAuth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    log_in(user)
    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    if user.save
      flash[:success] = 'Welcome to Brandeis Class Hub!'
      redirect_to home_calendar_url
    else 
      puts "print errors"
      user.errors.full_messages.each do |msg| 
        puts msg 
      end
    end
  end

end
