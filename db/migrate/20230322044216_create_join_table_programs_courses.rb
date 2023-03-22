class CreateJoinTableProgramsCourses < ActiveRecord::Migration[7.0]
  def change
    create_join_table :programs, :courses do |t|
      t.index [:program_id, :course_id]
      t.index [:course_id, :program_id]
    end
  end
end
