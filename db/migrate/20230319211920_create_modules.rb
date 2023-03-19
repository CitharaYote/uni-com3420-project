class CreateModules < ActiveRecord::Migration[7.0]
  def change
    create_table :modules, id: false, primary_key: :module_code do |t|
      t.string :module_code, null: false
      t.integer :credit

      t.timestamps
    end
  end
end
