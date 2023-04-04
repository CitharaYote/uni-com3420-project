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
    redirect_to root_path

  end

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: "Student was successfully created."
    else
      render :new, status: :unprocessable_entity
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.fetch(:student, {})
      params.require(:student).permit(:regID,:status,:program_name,:t_credit)
    end
end
