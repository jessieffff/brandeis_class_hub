class OtherEventsController < ApplicationController
  before_action :logged_in_user
  before_action :check_other_event, only: %i[ show edit update destroy ]

  # GET
  def index
    @other_events = OtherEvent.all
  end

  # GET
  def show; end

  # GET /other_events/new
  def new
    @other_event = OtherEvent.new
  end

  # GET
  def edit; end

  # POST /other_events or /other_events.json
  def create
    @other_event = OtherEvent.new(other_event_params)
    respond_to do |format|
      if @other_event.save
        format.html { redirect_to calendar_other_event_path(Calendar.find_by(id: @other_event.calendar_id).invite_token, @other_event.slug), 
          notice: "Event was successfully created."}
        format.json { render :show, status: :created, location: @other_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @other_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_events/1 or /other_events/1.json
  def update
    @other_event.slug = nil if @other_event.name != params[:name]
    respond_to do |format|
      if @other_event.update(other_event_params)
        format.html { redirect_to calendar_path(Calendar.find_by(id: @other_event.calendar_id)), 
          notice: "Other event was successfully updated."}
        format.json { render :show, status: :ok, location: @other_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @other_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_events/1 or /other_events/1.json
  def destroy
    prev_calendar_id = Calendar.find_by(id: @other_event.calendar_id)
    @other_event.destroy

    respond_to do |format|
      format.html { redirect_to calendar_path(prev_calendar_id), notice: "Event was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_event
      @other_event = OtherEvent.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def check_other_event
      if !@other_event = OtherEvent.friendly.find_by_slug(params[:slug]).nil?
        @other_event = OtherEvent.friendly.find_by_slug(params[:slug])
      else
        render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
      end
    end

    # Only allow a list of trusted parameters through.
    def other_event_params
      params.require(:other_event).permit(:calendar_id, :name, :start_time, :end_time, :date, :slug)
    end

end
