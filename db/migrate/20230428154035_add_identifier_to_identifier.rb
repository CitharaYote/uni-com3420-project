class AddIdentifierToIdentifier < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :isModule, :boolean
  end
end
