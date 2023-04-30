class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  def import
    file = params[:file]

    #redirect if no file
    return redirect_to root_path, alert: 'no file selected' unless file
    return redirect to the root_path, alert: 'Please select CSV file instead' unless file.content_type == 'text/csv'
    
    #import data 
    csvImportService = CsvImportService.new(file)
    csvImportService.import

    #redirect to the root path
    redirect_to students_path

  end

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/1
  def show
    @student = Student.find(params[:id])
    @courses = @student.courses.joins(:marks).select("courses.*, marks").distinct
  end

  # GET /students/new
  def new
    @programs = Program.pluck("program_name,id")
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    Rails.logger.info student_params
    Rails.logger.info "-----"
    program_id = params[:student][:program_id]
    program_name = Program.find(program_id).program_name rescue ""
    @student = Student.new(student_params)
    @student.program_name = program_name
    Rails.logger.info @student.to_json
    if @student.save
      redirect_to "/students", notice: "Student was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def course_detail
    @data = []
    student = Student.find(params[:id])
    marks = student.marks
    marks.each do |mark|
    course = mark.course
    tmp_data = {module_code:course.module_code,credit:course.credit,title:course.title,status:student.status}
    @data << tmp_data
end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Student was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: "Student was successfully destroyed."
  end

  # POST /programs/search
  def search
    @students = Student.where(regID: params[:search][:regID])
    @students = Student.where(program_id: params[:search][:program_id])
    @students = Student.where(status: params[:search][:status])
    @students = Student.where(program_name: params[:search][:program_name])
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.fetch(:student, {})
      params.require(:student).permit(:id, :regID, :status, :forename, :surname,:program_id)
    end
end
