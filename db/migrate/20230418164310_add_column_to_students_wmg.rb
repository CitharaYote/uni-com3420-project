# frozen_string_literal: true

class AddColumnToStudentsWmg < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :mean_grade, :integer
  end
end
