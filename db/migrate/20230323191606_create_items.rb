class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items, id:false do |t|
      t.string :name, primary_key:true
      t.integer :value

      t.timestamps
    end
  end
end
