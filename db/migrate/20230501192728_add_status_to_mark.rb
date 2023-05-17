# frozen_string_literal: true

class AddStatusToMark < ActiveRecord::Migration[7.0]
  def change
    add_column :marks, :status, :string
    add_column :marks, :average_grade, :integer
  end
end
