class ProgramsController < ApplicationController
  before_action :set_program, only: %i[ show edit update destroy ]

  # GET /programs
  def index
    @programs = Program.all
  end

  # GET /programs/1
  def show
    @program = Program.find(params[:id])
    @courses = @program.courses.joins(:courses_programs).select("courses.*, courses_programs").distinct
  end

  # GET /programs/new
  def new
    @program = Program.new
    @courses = Course.all
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  def create
    @program = Program.new(program_params)
    @program.course_ids = params[:program][:course_ids]

    if @program.save
      redirect_to @program, notice: "Program was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /programs/1
  def update
    Notification.create!(program_id:@program.id,user_id:current_user.id,source_name:@program.program_name,source_title:@program.title,target_name:program_params[:program_name],target_title:program_params[:title])
    if @program.update(program_params)
      redirect_to @program, notice: "Program was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /programs/1
  def destroy
    @program.destroy
    redirect_to programs_url, notice: "Program was successfully destroyed."
  end

  # POST /programs/search
  def search
    @programs = Program.where(program_name: params[:search][:program_name])
    @programs = Program.where(title: params[:search][:title])
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_params
      params.require(:program).permit(:id, :program_name, :title , course_ids: [])
    end
end
