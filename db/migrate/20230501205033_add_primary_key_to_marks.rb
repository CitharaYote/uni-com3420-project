# frozen_string_literal: true

class AddPrimaryKeyToMarks < ActiveRecord::Migration[7.0]
  def change
    add_column :marks, :mark_id, :primary_key
    add_index :marks, :mark_id
  end
end
