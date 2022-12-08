class HolidaysController < ApplicationController
  before_action :logged_in_user
  before_action :check_holiday, only: %i[ show edit update destroy ]

  # GET /holidays or /holidays.json
  def index
    @holidays = Holiday.all
  end

  # GET /holidays/1 or /holidays/1.json
  def show
  end

  # GET /holidays/new
  def new
    @holiday = Holiday.new
  end

  # GET 
  def edit
  end

  # POST 
  def create
    @holiday = Holiday.new(holiday_params)
    puts @holiday.inspect
    respond_to do |format|
      if @holiday.save!
        format.html { redirect_to calendar_holiday_path(Calendar.find_by(id: @holiday.calendar_id).invite_token, @holiday.slug), 
          notice: "Holiday was successfully created." }
        format.json { render :show, status: :created, location: @holiday }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT
  def update
    @holiday.slug = nil if @holiday.name != params[:name]
    respond_to do |format|

      if @holiday.update(holiday_params)
        format.html { redirect_to calendar_path(Calendar.find_by(id: @holiday.calendar_id).invite_token), 
          notice: "Holiday was successfully updated." }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE
  def destroy
    @prev_calendar_id = Calendar.find_by(id: @holiday.calendar_id)
    @holiday.destroy
    respond_to do |format|
      format.html { redirect_to calendar_path(@prev_calendar_id), notice: "Holiday was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_holiday
      if !@holiday = Holiday.friendly.find_by_slug(params[:slug]).nil?
        @holiday = Holiday.friendly.find_by_slug(params[:slug])
      else
        render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
      end
    end

    # Only allow a list of trusted parameters through.
    def holiday_params
      params.require(:holiday).permit(:calendar_id, :name, :date, :holiday_type, :slug)
    end

end
