
class CsvImportService
    require 'csv'

    def initialize(file)
        @file = file
        @count = 0
    end

    def import
        @count = 0 
        CSV.foreach(@file.path, headers:true) do |row|
            
            if !Program.exists?(program_name: row['Programme Code'])
                Program.create!(program_name: row['Programme Code'])
            end

            program = Program.find_by(program_name: row['Programme Code'])

            Student.create!(regID: row['Reg No.'], forename: row['Forename'], program_name: row['Programme Code'], surname: row['Surname'], status: row['Reg. Status'], program_id: program.id)
            @count += 1
        end
    @count
    end

    def number_imported_with_last_run
        @count
    end
end
