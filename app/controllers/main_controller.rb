class MainController < ApplicationController
   before_action :check_students
  def current_url(overwrite={})
    url_for :only_path => false, :params => params.merge(overwrite)
  end

  def home
    
    @programs = Program.all
    @courses = []
    if @programs.present?
      if Program.first.courses.joins(:courses_programs).select("courses.*, courses_programs").distinct.present?
        @courses =Program.first.courses.joins(:courses_programs).select("courses.*, courses_programs").distinct
      end
    else
      @programs = []
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
      
      @students = Student.where(regID: request.params[:student_id])

      # this bit works for any column except regID so i'm guessing it doesn't like the capital letters
      # @students = Student.where("regID LIKE ?", "%#{request.params[:student_id]}%")
      if !@students.present?
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
  private
    def check_students
      @people = Student.all
      @notifications = Notification.all
      # @people.each do |person|
      #   if person.updated_at.to_date < DateTime.current - 1.hour
      #     if !@notifications.where(identifier: ("Student Registration: " +person.regID.to_s))
      #       Notification.create!(identifier: "Student Registration: " + person.regID.to_s, alert: "Student data has not been updated for over 3 years.", isModule: false)
      #     else
      #       puts "\n\n\n\n\n\n\n\nW #{Notification.where(identifier: ("Student Registration: " +person.regID.to_s))}\n\n\n\n\n\n\n\n\n"
      #     end
      #   end
      # end
    end
end