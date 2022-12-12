class UserCalendarsController < ApplicationController
  before_action :set_user_calendar, only: %i[show edit update destroy]
  before_action :logged_in_user
  # GET /user_calendars or /user_calendars.json
  def index
    redirect_to calendars_path
  end

  # GET
  def show; end

  def new
    if logged_in?
      create
    else
      # a user doesn't have an account
      redirect_to sign_up_path(invite_token: params[:calendar_invite_token])
    end
  end

  def create
    calendar = Calendar.find_by_invite_token(params[:calendar_invite_token])
    UserCalendar.where(calendar:, user: current_user).first_or_create
    redirect_to home_calendar_url
  end


  def subscribe_calendar
    calendar_id = params[:calendar_id]
    @user_calendar = UserCalendar.create(
      calendar_id: calendar_id,
      user_id: Current.user.id,
    )
    redirect_to home_calendar_url
  end
 

  # GET /user_calendars/1/edit
  def edit; end


  # PATCH/PUT /user_calendars/1 or /user_calendars/1.json
  def update
    respond_to do |format|
      if @user_calendar.update(user_calendar_params)
        format.html { redirect_to user_calendar_url(@user_calendar), notice: 'User calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_calendar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_calendars/1 or /user_calendars/1.json
  def destroy
    @user_calendar.destroy

    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'User calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_calendar
    @user_calendar = UserCalendar.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_calendar_params
     params.require(:user_calendar).permit(:user_id, :calendar_id, :creator)
   end


end