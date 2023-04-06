class DropOldTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :csvitems 
    drop_table :table_csv_items
  end
end
