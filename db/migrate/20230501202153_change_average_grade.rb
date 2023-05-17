# frozen_string_literal: true

class ChangeAverageGrade < ActiveRecord::Migration[7.0]
  def change
    change_column :marks, :average_grade, :float
  end
end
