class AddReferencesToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :course, foreign_key: true
  end
end
