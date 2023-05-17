# frozen_string_literal: true

class CreateCourse < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :module_code, null: false
      t.integer :credit
      t.string :title

      t.timestamps
    end
  end
end
