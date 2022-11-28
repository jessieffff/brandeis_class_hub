class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
before_action :logged_in_user
  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        CalendarHelper.generate_class_period(@course.repetition_frequency, @course.name, @course.id, @course.start_date, @course.end_date,
                                           @course.start_time, @course.end_time, @course.calendar_id)
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import
    Course.import(params[:file])
    redirect_to courses_url, notice: "Courses Added Successfuly"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params['course']['repetition_frequency'] = params['course']['repetition_frequency'].join('')
      params['course']['start_time'] = Time.parse(params['course']['start_time']).strftime("%I:%M%p")
      params['course']['end_time'] = Time.parse(params['course']['end_time']).strftime("%I:%M%p")
      params.require(:course).permit(:calendar_id, :name, :start_time, :end_time, :start_date, :end_date, :location, :professor_name, :repetition_frequency)
    end


end
