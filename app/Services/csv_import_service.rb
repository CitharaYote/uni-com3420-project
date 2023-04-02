
class CsvImportService
    require 'csv'

    def initialize(file)
        @file = file
        @count = 0
    end

    def import
        @count = 0 
        CSV.foreach(@file.path, headers:true) do |row|
            Item.create(name: row['name'], value: row['value'])
            @count += 1
        end
    @count
    end

    def number_imported_with_last_run
        @count
    end
end
