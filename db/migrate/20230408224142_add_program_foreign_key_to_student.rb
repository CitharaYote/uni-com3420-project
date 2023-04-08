class AddProgramForeignKeyToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :program_id, :bigint
  end
end
