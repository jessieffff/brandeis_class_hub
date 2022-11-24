class ClassPeriodsController < ApplicationController
  before_action :set_class_period, only: %i[ show edit update destroy ]
before_action :logged_in_user
  # GET /class_periods or /class_periods.json
  def index
    @class_periods = ClassPeriod.all
  end

  # GET /class_periods/1 or /class_periods/1.json
  def show
  end

  # GET /class_periods/new
  def new
    @class_period = ClassPeriod.new
  end

  # GET /class_periods/1/edit
  def edit
  end

  # POST /class_periods or /class_periods.json
  def create
    @class_period = ClassPeriod.new(class_period_params)

    respond_to do |format|
      if @class_period.save
        format.html { redirect_to class_period_url(@class_period), notice: "Class period was successfully created." }
        format.json { render :show, status: :created, location: @class_period }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_periods/1 or /class_periods/1.json
  def update
    respond_to do |format|
      if @class_period.update(class_period_params)
        format.html { redirect_to class_period_url(@class_period), notice: "Class period was successfully updated." }
        format.json { render :show, status: :ok, location: @class_period }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_periods/1 or /class_periods/1.json
  def destroy
    @class_period.destroy

    respond_to do |format|
      format.html { redirect_to class_periods_url, notice: "Class period was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_period
      @class_period = ClassPeriod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_period_params
      params.require(:class_period).permit(:course_id, :start_time, :end_time)
    end

end
