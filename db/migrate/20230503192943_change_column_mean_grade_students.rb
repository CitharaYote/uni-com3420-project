# frozen_string_literal: true

class ChangeColumnMeanGradeStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :mean_grade
    add_column :students, :flagged, :boolean
  end
end
