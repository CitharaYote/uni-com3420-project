# frozen_string_literal: true

class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.string :username
      t.boolean :is_admin

      t.timestamps
    end
  end
end
