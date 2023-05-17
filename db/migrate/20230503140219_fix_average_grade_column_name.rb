# frozen_string_literal: true

class FixAverageGradeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :marks, :average_grade, :final_score
  end
end
