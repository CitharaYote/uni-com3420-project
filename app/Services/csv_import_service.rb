
class CsvImportService
    require 'csv'

    def initialize(file)
        @file = file
        @count = 0
    end

    def import
        @count = 0 
        module_code = ''
        CSV.foreach(@file.path, headers:true) do |row|
            
            module_code = row['Module Code']
            #create a new program automatically for new programmes
            if !Program.exists?(program_name: row['Programme Code'])
                program = Program.create!(program_name: row['Programme Code'])
                Notification.create!(identifier: row['Programme Code'], alert: 'New Programme added please update associated modules')
            else
                program = Program.find_by(program_name: row['Programme Code'])
            end

            #automatically make a new course for new modules
            if !Course.exists?(module_code: row['Module Code'])
                course = Course.create!(module_code: row['Module Code'])
                Notification.create!(identifier: row['Module Code'], alert: 'New Module added please update accordingly')
                course.programs << program
            else
                course = Course.find_by(module_code: row['Module Code'])
            end

            #create a student and set their marks in DB
            student = Student.create!(regID: row['Reg No.'], forename: row['Forename'], program_name: row['Programme Code'], surname: row['Surname'], status: row['Reg. Status'], program_id: program.id)
            Mark.create(fst_grade: row['1st Grade'], scd_grade: row['2nd Grade'], course_id: course.id, student_id: student.id)
            @count += 1
  
        end
        Notification.create!(identifier: module_code, alert: "#{@count} students added to module")
    @count
    end

    def number_imported_with_last_run
        @count
    end
end
