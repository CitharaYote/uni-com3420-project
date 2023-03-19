class CreateStudent < ActiveRecord::Migration[7.0]
  def change
    create_table :students, id: false, primary_key: :regID do |t|
      t.bigint :regID, null: false, first: true 
      t.string :status
      

      t.timestamps
    end
  end
end
