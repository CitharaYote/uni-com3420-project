class CreateMarks < ActiveRecord::Migration[7.0]
  def change
    create_table :marks, id: false do |t|
      t.belongs_to :student
      t.belongs_to :course
      t.bigint :fst_grade, null: true
      t.bigint :scd_grade, null: true

      t.timestamps
    end
  end
end
