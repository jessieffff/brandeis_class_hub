class CoursesController < ApplicationController
  before_action :logged_in_user
  before_action :check_course, only: %i[ show edit update destroy ]

  # GET
  def show;end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET
  def edit;end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        CalendarHelper.generate_class_period(@course.repetition_frequency, @course.name, @course.id, @course.start_date, @course.end_date,
                                           @course.start_time, @course.end_time, @course.calendar_id)
        format.html { redirect_to calendar_course_path(Calendar.find_by(id: @course.calendar_id).invite_token, @course.slug), 
          notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    @course.slug = nil if @course.name != params[:name]
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to calendar_course_path(Calendar.find_by(id: @course.calendar_id).invite_token, @course.slug), 
          notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    prev_calendar_id = Calendar.find_by(id: @course.calendar_id)
    @course.destroy

    respond_to do |format|
      format.html { redirect_to home_calendar_url, notice: "Course was successfully destroyed." }
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
          start_time: ActiveSupport::TimeZone['UTC'].parse(time[0..time.index('-') - 2]),
          end_time: ActiveSupport::TimeZone['UTC'].parse(time[time.index('-') + 2..time.length]),
          professor_name: spreadsheet.row(i)[9],
          repetition_frequency: spreadsheet.row(i)[7][0, divider_index[0]],
          slug: spreadsheet.row(i)[1].gsub(/\s+/, "").downcase
        )
        CalendarHelper.generate_class_period(@course.repetition_frequency, @course.name, @course.id, @course.start_date,
            @course.end_date, @course.start_time, @course.end_time, @course.calendar_id)
      end
      flash[:notice] = "Courses Imported"
      redirect_to courses_url
    rescue Exception => e
      if file.nil?
        e = "Please choose file to upload"
      end
      flash[:notice] = e
      redirect_to courses_url
    end
 end

  def add_new_assignment
    calendar_id = params[:calendar_id]
    course_id = params[:course_id]
    @assignment = Assignment.new(
      calendar_id: calendar_id,
      course_id: course_id,
      name: "Enter assignment name",
      due_date: ActiveSupport::TimeZone['UTC'].parse(" "),
      due_time: ActiveSupport::TimeZone['UTC'].parse(" "),
      slug: "Enter assignment name".gsub(/\s+/, "").downcase
    )
    if @assignment.save
      redirect_to edit_calendar_course_assignment_path(Calendar.find_by(id: calendar_id).invite_token, Course.find_by(id: course_id).slug, @assignment.slug)
    else
      @assignment.errors.each do |error| 
        puts error.full_message
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      if params['course']['repetition_frequency'] != nil
        if params['course']['repetition_frequency'].class == Array
          params['course']['repetition_frequency'] = params['course']['repetition_frequency'].join('')
        end
      end

      if params['course']['start_time'] != ""
        params['course']['start_time'] = Time.parse(params['course']['start_time']).strftime("%I:%M%p")
      end

      if params['course']['end_time'] != ""
        params['course']['end_time'] = Time.parse(params['course']['end_time']).strftime("%I:%M%p")
      end
      params.require(:course).permit(:calendar_id, :name, :start_time, :end_time, :start_date, :end_date, :location, :professor_name, :repetition_frequency)
    end

    # Use callbacks to share common setup or constraints between actions.
    def check_course
      if !@course = Course.friendly.find_by_slug(params[:slug]).nil?
        @course = Course.friendly.find_by_slug(params[:slug])
      else
        render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
      end
    end

end
