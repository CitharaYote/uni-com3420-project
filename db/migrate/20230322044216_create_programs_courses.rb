class CreateProgramsCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses_programs, id: false do |t|
      t.belongs_to :course
      t.belongs_to :program
    end
  end
end
