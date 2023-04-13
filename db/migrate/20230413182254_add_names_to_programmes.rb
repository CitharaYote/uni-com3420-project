class AddNamesToProgrammes < ActiveRecord::Migration[7.0]
  def change
    add_column :programs, :title, :string
  end
end
