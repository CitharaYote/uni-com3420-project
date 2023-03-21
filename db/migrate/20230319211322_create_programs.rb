class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs, id: false, primary_key: :program_code do |t|
      t.string :program_code, null: false

      t.timestamps
    end
  end
end
