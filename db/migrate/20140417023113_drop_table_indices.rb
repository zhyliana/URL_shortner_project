class DropTableIndices < ActiveRecord::Migration
  def change
    drop_table("table_indices")
  end
end
