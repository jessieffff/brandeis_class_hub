class AssignmentsController < ApplicationController
  before_action :logged_in_user
  before_action :check_assignment, only: %i[ show edit update destroy ]

  # GET /assignments or /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET
  def show; end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit; end

  # POST /assignments or /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to calendar_course_assignment_path(Calendar.find_by(id: @assignment.calendar_id).invite_token, 
          Course.find_by(id: @assignment.course_id).slug, @assignment.slug),
          notice: "Assignment was successfully created." }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1 or /assignments/1.json
  def update
    @assignment.slug = nil if @assignment.name != params[:name]
    puts "ccccccccc"
    puts assignment_params
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to calendar_course_assignment_path(Calendar.find_by(id: @assignment.calendar_id).invite_token, 
          Course.find_by(id: @assignment.course_id).slug, @assignment.slug),
          notice: "Assignment was successfully updated." }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    prev_calendar_id = Calendar.find_by(id: @assignment.calendar_id)
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to calendar_path(prev_calendar_id), notice: "Assignment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_params
      params.require(:assignment).permit(:calendar_id, :name, :due_date, :due_time, :course_id, :slug)
    end


    # Use callbacks to share common setup or constraints between actions.
    def check_assignment
      if !@assignment = Assignment.friendly.find_by_slug(params[:slug]).nil?
        @assignment = Assignment.friendly.find_by_slug(params[:slug])
      else
        render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
      end
    end

end
