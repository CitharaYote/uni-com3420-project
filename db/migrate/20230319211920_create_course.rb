class CreateCourse < ActiveRecord::Migration[7.0]
  def change
    create_table :courses, id: false, primary_key: :course_code do |t|
      t.string :course_code, null: false
      t.integer :credit
      t.string :title
      
      t.timestamps
    end
  end
end
