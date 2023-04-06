class CreateStudent < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.belongs_to :program
      t.bigint :regID, null: false
      t.string :status
      t.integer :t_credit

      t.timestamps
    end
  end
end
