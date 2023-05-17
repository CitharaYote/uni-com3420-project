# frozen_string_literal: true

class AddProgramIdToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :program_name, :string
  end
end
