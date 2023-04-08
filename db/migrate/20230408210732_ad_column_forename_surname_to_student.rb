class AdColumnForenameSurnameToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :forename, :string
    add_column :students, :surname, :string
  end
end
