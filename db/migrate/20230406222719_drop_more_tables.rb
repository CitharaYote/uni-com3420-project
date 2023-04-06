class DropMoreTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :modules
    drop_table :modules_students
  end
end
