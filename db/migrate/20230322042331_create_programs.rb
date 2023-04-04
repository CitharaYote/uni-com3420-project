class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs, id: false, primary_key: :program_name do |t|
      t.string :program_name

      t.timestamps
    end
    add_index :programs, :program_name, unique: true
  end
end
