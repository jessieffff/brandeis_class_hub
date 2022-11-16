class UserCalendarsController < ApplicationController
  before_action :set_user_calendar, only: %i[ show edit update destroy ]

  # GET /user_calendars or /user_calendars.json
  def index
    @user_calendars = UserCalendar.all
  end

  # GET /user_calendars/1 or /user_calendars/1.json
  def show
  end

  # GET /user_calendars/new
  def new
    @user_calendar = UserCalendar.new
  end

  # GET /user_calendars/1/edit
  def edit
  end

  # POST /user_calendars or /user_calendars.json
  def create
    @user_calendar = UserCalendar.new(user_calendar_params)

    respond_to do |format|
      if @user_calendar.save
        format.html { redirect_to user_calendar_url(@user_calendar), notice: "User calendar was successfully created." }
        format.json { render :show, status: :created, location: @user_calendar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_calendars/1 or /user_calendars/1.json
  def update
    respond_to do |format|
      if @user_calendar.update(user_calendar_params)
        format.html { redirect_to user_calendar_url(@user_calendar), notice: "User calendar was successfully updated." }
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
      format.html { redirect_to user_calendars_url, notice: "User calendar was successfully destroyed." }
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
