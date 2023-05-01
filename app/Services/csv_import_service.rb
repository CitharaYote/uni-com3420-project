
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

            #only add marks to 
            if !Student.exists?(regID: row['Reg No.'])
                student = Student.create!(regID: row['Reg No.'], forename: row['Forename'], program_name: row['Programme Code'], surname: row['Surname'], program_id: program.id)
                mark = Mark.create!(fst_grade: row['1st Grade'], scd_grade: row['2nd Grade'], course_id: course.id, student_id: student.id)
                if !(mark.fst_grade.present?) || !(mark.scd_grade.present?) 
                    student.status = 'nc'
                    student.save
                else
                    student.status = 'ok'
                    student.save
                end
            else
                #Only create a new mark if the student doesnt have a mark in that module
                student = Student.find_by(regID: row['Reg No.'])
                mark = Mark.find_by(course_id: course.id, student_id: student.id)
                if !mark.present?
                    mark = Mark.create!(fst_grade: row['1st Grade'], scd_grade: row['2nd Grade'], course_id: course.id, student_id: student.id)
                    if !(mark.fst_grade.present?) || !(mark.scd_grade.present?) 
                        student.status = 'nc'
                        student.save
                    else
                        student.status = 'ok'
                        student.save
                    end
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
