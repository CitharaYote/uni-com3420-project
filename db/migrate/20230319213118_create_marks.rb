class CreateMarks < ActiveRecord::Migration[7.0]
  def change
    create_table :marks, id: false do |t|
      t.belongs_to :student
      t.belongs_to :course
      t.integer :mark

      t.timestamps
    end
  end
end
