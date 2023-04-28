class ChangeNotificationColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :source_name
    remove_column :notifications, :source_title
    remove_column :notifications, :target_name
    remove_column :notifications, :target_title
    remove_column :notifications, :user_id

    add_column :notifications, :identifier, :string
    add_column :notifications, :alert, :string
  end
end
