class CreateProgramsCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :programs_courses, id: false do |t|
      t.belongs_to :program
      t.belongs_to :course
    end
  end
end
