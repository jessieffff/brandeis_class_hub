require_relative '../lib/month'
class CalendarsController < ApplicationController
  before_action :set_calendar, only: %i[show edit update destroy]
  before_action :logged_in_user
  # GET /calendars or /calendars.json
  def index
    @calendars = Calendar.where(user_id: current_user.id)
  end

  # case insensitive and is public
  def search
    @calendars = Calendar.where("name ILIKE ? AND shared = ?", "%" + params[:q] + "%", true) 
  end

  # GET /calendars/1 or /calendars/1.json
  def show
    @calendar = Calendar.find_by_invite_token(params[:invite_token])
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit; end

  # POST /calendars or /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user_id = Current.user.id if Current.user
    respond_to do |format|
      if @calendar.save
        n = UserCalendar.new(user_id: @calendar.user_id, calendar_id: @calendar.id, creator: true)
        n.save
        format.html { redirect_to home_calendar_url, notice: 'Calendar was successfully created.' }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1 or /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to home_calendar_url, notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1 or /calendars/1.json
  def destroy
    @calendar.destroy

    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar
    @calendar = Calendar.find_by_invite_token(params[:invite_token])
  end

  # Only allow a list of trusted parameters through.
  def calendar_params
    params.require(:calendar).permit(:name, :description, :user_id, :shared, :invite_token)
  end

end
