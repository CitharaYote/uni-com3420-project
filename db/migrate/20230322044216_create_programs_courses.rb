class CreateProgramsCourses < ActiveRecord::Migration[7.0]
  def change
    create_join_table :programs, :courses, column_options: {null: true} do |t|
      t.string :course_code
      t.string :program_name
      t.index [:course_code, :program_name]
      t.index [:program_name, :course_code]
    end
  end
end
