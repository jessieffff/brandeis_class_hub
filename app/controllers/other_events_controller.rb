class OtherEventsController < ApplicationController
  before_action :set_other_event, only: %i[ show edit update destroy ]
  before_action :logged_in_user
  # GET /other_events or /other_events.json
  def index
    @other_events = OtherEvent.all
  end

  # GET /other_events/1 or /other_events/1.json
  def show
  end

  # GET /other_events/new
  def new
    @other_event = OtherEvent.new
  end

  # GET /other_events/1/edit
  def edit
  end

  # POST /other_events or /other_events.json
  def create
    @other_event = OtherEvent.new(other_event_params)
    respond_to do |format|
      if @other_event.save
        format.html { redirect_to other_event_url(@other_event), notice: "Other event was successfully created." }
        format.json { render :show, status: :created, location: @other_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @other_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_events/1 or /other_events/1.json
  def update
    respond_to do |format|
      if @other_event.update(other_event_params)
        format.html { redirect_to other_event_url(@other_event), notice: "Other event was successfully updated." }
        format.json { render :show, status: :ok, location: @other_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @other_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_events/1 or /other_events/1.json
  def destroy
    @other_event.destroy

    respond_to do |format|
      format.html { redirect_to calendars_url, notice: "Other event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_event
      @other_event = OtherEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def other_event_params
      params.require(:other_event).permit(:calendar_id, :name, :start_time, :end_time, :date)
    end

end
