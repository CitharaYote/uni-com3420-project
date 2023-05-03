class MainController < ApplicationController

  def current_url(overwrite={})
    url_for :only_path => false, :params => params.merge(overwrite)
  end

  def home
    
    @programs = Program.all
    if !Program.first.courses.joins(:courses_programs).select("courses.*, courses_programs").distinct.present?
      @courses = []
    else
      @courses =Program.first.courses.joins(:courses_programs).select("courses.*, courses_programs").distinct
    end 
    @students = Student.all
    @course_list = []
    if params[:course_checkbox].present?
      @course_list = params[:course_checkbox]
    end
    
    if request.params[:program_name] && Program.find_by(program_name: request.params[:program_name])
      
      @program = Program.find_by(program_name: request.params[:program_name])
      @courses = @program.courses.joins(:courses_programs).select("courses.*, courses_programs").distinct
      @students = Student.where(program_name: request.params[:program_name])
    
    elsif request.params[:student_id]
      # @students = Student.where("regID LIKE ?", "%" + Student.sanitize_sql_like(request.params[:student_id]) + "%")
      @students = Student.where(regID: request.params[:student_id])
      if @students
        redirect_to "/", notice: "Could not find student with that registration."
      end
    end
  end

  # the rest of this shit doesn't work so feel free to get rid of it
  def set_filtered_data
    @filtered_data = @data[@module_index]
  end

  def set_module_index
    @module_index = params[:module_index].to_i
    respond_to do |format|
    format.js { render js: "console.log('Successfully updated module index');" }
    end
    set_filtered_data
  end

  def set_search(string)
    @search = string
  end

  def filter_data
    if @search == ""
      set_filtered_data
    else
      filtered_data = []

      @data[@module_index].each do |row|
        row.each do |key, value|
          if value.downcase.include? @search.downcase
            filtered_data << row
            break
          end
        end
      end

      @filtered_data = filtered_data
    end
  end
end