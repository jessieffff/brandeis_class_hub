class HolidaysController < ApplicationController
  include HolidaysHelper

  before_action :logged_in_user
  before_action :check_holiday, only: %i[ show edit update destroy ]
  # before_action :set_holiday, only: %i[ show edit update destroy ]
  


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

  # GET /holidays/1/edit
  def edit
  end

  # POST /holidays or /holidays.json
  def create
    @holiday = Holiday.new(holiday_params)

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to holiday_url(@holiday), notice: "Holiday was successfully created." }
        format.json { render :show, status: :created, location: @holiday }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holidays/1 or /holidays/1.json
  def update
    @holiday.slug = nil if @holiday.name != params[:name]
    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to holiday_url(@holiday), notice: "Holiday was successfully updated." }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holidays/1 or /holidays/1.json
  def destroy
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to home_calendar_path, notice: "Holiday was successfully destroyed." }
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

    # def set_holiday
    #   @holiday = Holiday.friendly.find_by_slug(params[:slug])
    # end


    # Only allow a list of trusted parameters through.
    def holiday_params
      params.require(:holiday).permit(:calendar_id, :name, :date, :holiday_type)
    end

end
