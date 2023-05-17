# frozen_string_literal: true

class CreateCoursesPrograms < ActiveRecord::Migration[7.0]
  def change
    create_join_table :courses, :programs do |t|
      t.index :program_id
      t.index :course_id

      t.timestamps
    end
  end
end
