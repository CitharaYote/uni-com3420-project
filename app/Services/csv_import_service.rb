
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
            #create a new program and set notification automatically for new programmes
            if !Program.exists?(program_name: row['Programme Code'])
                program = Program.create!(program_name: row['Programme Code'])
                notification = Notification.create!(identifier: row['Programme Code'], alert: 'New Programme added please update associated modules', isModule: false)
                program.notifications << notification
            else
                program = Program.find_by(program_name: row['Programme Code'])
            end

            #automatically make a new course and  set notification for new modules 
            if !Course.exists?(module_code: row['Module Code'])
                course = Course.create!(module_code: row['Module Code'])
                notification = Notification.create!(identifier: row['Module Code'], alert: 'New Module added please update accordingly', isModule: true)

                course.notifications << notification
                course.programs << program
            else
                course = Course.find_by(module_code: row['Module Code'])
            end

            #Search for the current student
            student = Student.find_by(regID: row['Reg No.'])

            #if the student isnt in the database create a new student
            if !student.present?
                student = Student.create!(regID: row['Reg No.'], forename: row['Forename'], program_name: row['Programme Code'], surname: row['Surname'], program_id: program.id, status: row['Reg. Status'])
            end
            #Only create a new mark if the student doesnt have a mark in that module
            mark = Mark.find_by(course_id: course.id, student_id: student.id)
            if !mark.present?
                mark = Mark.create!(fst_grade: row['1st Grade'], scd_grade: row['2nd Grade'], course_id: course.id, student_id: student.id)
                #classify marks accordingly
                if (row['1st Grade'] == "NC")  || (row['2nd Grade'] == "NC")
                    mark.status = 'NC'
                    mark.average_grade = 0
                    mark.save
                else
                    #check if the first grade is there?
                    if !mark.fst_grade.present? 
                        mark.average_grade = mark.scd_grade
                    else
                        mark.average_grade = mark.fst_grade
                    end

                    if mark.average_grade < 40
                        mark.status = 'F'
                    else
                        mark.status = 'OK'
                    end
                    mark.save
                end
            end 
            @count += 1
        end
        #set a notification to explain to the user that a new program has been made
        notification = Notification.create!(identifier: module_code, alert: "#{@count} students added to module", isModule: true)
        course = Course.find_by(module_code: module_code)
        course.notifications << notification
    @count
    end

    def number_imported_with_last_run
        @count
    end
end
