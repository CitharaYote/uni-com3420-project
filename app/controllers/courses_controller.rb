# frozen_string_literal: true

# CoursesController handles the /courses pathways and most of the information relating to Courses (Modules)
class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  # Index course page, @courses provides the data needed for the HAML and ERB files
  # GET /courses
  def index
    @courses = Course.all
    return unless params[:program].present?

    @courses = Course.joins(:courses_programs).where(courses_programs: { program_id: params[:program] })
  end

  # Show provides the program information for the HAML and ERB files
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
  def edit; end

  # create is called when new records are being added to the Course ActiveRecord from any /courses pathway form or other submission.
  # POST /courses
  def create
    # Creates a new course using the course_params function
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # destroy deletes the marks and notifications associated with the course
  # DELETE /courses/1
  def destroy
    @notifications = Notification.where(course_id: @course.id)
    @notifications.each(&:destroy)

    @marks = Mark.where(course_id: @course.id)
    @marks.each(&:destroy)

    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  # search provides the search functionality for indentifying a specific module/course based on it's module_code
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

  # course_params only allows a list of trusted parameters through for submission to the database
  def course_params
    params.require(:course).permit(:id, :module_code, :credit, :title, program_ids: [])
  end
end
