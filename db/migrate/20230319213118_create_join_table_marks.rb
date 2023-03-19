class CreateJoinTableMarks < ActiveRecord::Migration[7.0]
  def change
    create_join_table :students, :modules, id: false do |t|
      # t.index [:student_id, :module_id]
      # t.index [:module_id, :student_id]
      t.float :mark
    end
  end
end
