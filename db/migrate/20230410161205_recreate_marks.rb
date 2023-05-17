# frozen_string_literal: true

class RecreateMarks < ActiveRecord::Migration[7.0]
  def change
    create_join_table :course, :students, table_name: :marks do |t|
      t.index :student_id
      t.index :course_id

      t.bigint :fst_grade, null: true
      t.bigint :scd_grade, null: true

      t.timestamps
    end
  end
end
