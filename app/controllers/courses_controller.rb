class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses
  def index
    @courses = Course.all
    @courses = Course.joins(:courses_programs).where(courses_programs: {program_id: params[:program]}) if params[:program].present?
  end

  # GET /courses/1
  def show
    @program = Program.all
  end

  # GET /courses/new
  def new
    @course = Course.new
    @programs = Program.all
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: "Course was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: "Course was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: "Course was successfully destroyed."
  end

  # POST /courses/search
  def search
    @courses = Course.where(module_code: params[:search][:module_code])
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:id, :module_code, :credit, :title, program_ids:[])
    end
end
