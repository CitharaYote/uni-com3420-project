class CreateStudent < ActiveRecord::Migration[7.0]
  def change
    create_table :students, id: false, primary_key: :regID do |t|
      t.bigint :regID, null: false, first: true
      t.bigint :program_id
      t.string :status
      t.integer :t_credit

      t.timestamps
    end
  end
end
