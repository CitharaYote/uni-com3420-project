
class CsvImportService
    require 'csv'

    def initialize(file)
        @file = file
        @count = 0
    end

    def import
        @count = 0 
        CSV.foreach(@file.path, headers:true) do |row|
            
            #create a new program automatically for new programmes
            if !Program.exists?(program_name: row['Programme Code'])
                program = Program.create!(program_name: row['Programme Code'])
            else
                program = Program.find_by(program_name: row['Programme Code'])
            end
            #TODO
            #add a warning for the user that a new program has been made
            #give the user the name of the program and tell them to add relative courses

            #automatically make a new course for new modules
            if !Course.exists?(module_code: row['Module Code'])
                course = Course.create!(module_code: row['Module Code'])
                course.programs << program
            else
                course = Course.find_by(module_code: row['Module Code'])
            end
            #TODO
            #add a warning for user that a new course has been made 
            #give the specific course that has been made and tell the user to fill in credits

            #create a student and set their marks in DB
            student = Student.create!(regID: row['Reg No.'], forename: row['Forename'], program_name: row['Programme Code'], surname: row['Surname'], status: row['Reg. Status'], program_id: program.id)
            Mark.create(fst_grade: row['1st Grade'], scd_grade: row['2nd Grade'], course_id: course.id, student_id: student.id)
            @count += 1
        end
    @count
    end

    def number_imported_with_last_run
        @count
    end
end
