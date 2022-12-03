class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :logged_in_user

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
      format.html { redirect_to calendars_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import_from_excel
    file = params[:file]
    id = params[:calendar_id]
    begin
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(3)
      (4..spreadsheet.last_row).each do |i|
        time_and_freq = spreadsheet.row(i)[7]
        divider_index = (0 ... time_and_freq.length).find_all { |m| time_and_freq[m, 1] == '|' }
        time = time_and_freq[divider_index[0] + 2..divider_index[1] - 2]
        @course = Course.create(
          calendar_id: id,
          name: spreadsheet.row(i)[1],
          start_date: spreadsheet.row(i)[10],
          end_date: spreadsheet.row(i)[11],
          start_time: time[0..time.index('-') - 2],
          end_time: time[time.index('-') + 2..time.length],
          location: spreadsheet.row(i)[6],
          professor_name: spreadsheet.row(i)[9],
          repetition_frequency: spreadsheet.row(i)[7][0, divider_index[0]]
        )
        CalendarHelper.generate_class_period(@course.repetition_frequency, @course.name, @course.id, @course.start_date,
            @course.end_date, @course.start_time, @course.end_time, @course.calendar_id)
      end
      flash[:notice] = "Records Imported"
      redirect_to courses_url
    rescue Exception => e
      flash[:notice] = "Issues with file"
      redirect_to courses_url
    end
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
