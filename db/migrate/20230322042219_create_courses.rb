class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :module_code
      t.integer :credit

      t.timestamps
    end
  end
end
