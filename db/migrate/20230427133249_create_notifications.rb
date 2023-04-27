class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :program_id
      t.string :source_name
      t.string :target_name
      t.string :source_title
      t.string :target_title
      t.timestamps
    end
  end
end
