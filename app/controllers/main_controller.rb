=begin
MainController handles the main page (root).
If running on localhost you can find it as 'http://localhost:3000/'

=end


class MainController < ApplicationController
   before_action :check_students

  # current_url returns the current url the user is on.
  def current_url(overwrite={})
    url_for :only_path => false, :params => params.merge(overwrite)
  end

  # home provides the data and code for the root page for the haml
  def home
    # When loading the homepage, checks are done to ensure that if there is programs present to load up data, otherwise treat everything as blank (to avoid errors for no data)
    @programs = Program.all
    @courses = []
    if @programs.present?
      # Takes the first program and loads the courses based on the selected Program
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

    # Gets the URL parameters and checks for which search it is and then perfoms the search based on the parameters.
    if request.params[:program_name] && Program.find_by(program_name: request.params[:program_name])
      
      @program = Program.find_by(program_name: request.params[:program_name])
      @courses = @program.courses.joins(:courses_programs).select("courses.*, courses_programs").distinct
      @students = Student.where(program_name: request.params[:program_name])
    
    elsif request.params[:student_id]
      
      @students = Student.where(regID: request.params[:student_id])

      # @students essentially searches the records for a student matching the registration number inputted into the registration search bar (which then became attached as a variable in the URL)
      # The condition below checks the return of the ActiveRecord search
      if !@students.present?
        redirect_to "/", notice: "Could not find student with that registration."
      end
    end
  end

  def profile
  end

  # set_module_index sets the module's index for the modules in the sidebar shown in views/main/partials/_main_display_table.html.erb or on the root page and return the filtered data
  def set_module_index
    @module_index = params[:module_index].to_i
    respond_to do |format|
    format.js { render js: "console.log('Successfully updated module index');" }
    end
    set_filtered_data
  end
  
  # set_search takes a string input and returns @search (the input string) so that it can be used in the HAML and ERB HTML files
  def set_search(string)
    @search = string
  end

  #filter_data returns filtered data by using the @search string produced by set_search (in relation to module_index)
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
    # check_students checks all the students data when the homepage is loaded (done by default when a user logs in) and checks to see if any student data has not been touched for over 3 years. 
    # If that is the case, then users will recieve a notification regarding the student data in case they wish to delete
    def check_students
      @people = Student.all
      @notifications = Notification.all
      @people.each do |person|
        if person.updated_at.to_date < DateTime.current - 3.years
          if !@notifications.where(identifier: ("Student Registration: " +person.regID.to_s))
            Notification.create!(identifier: "Student Registration: " + person.regID.to_s, alert: "Student data has not been updated for over 3 years.", isModule: false)
          end
        end
      end
    end
end