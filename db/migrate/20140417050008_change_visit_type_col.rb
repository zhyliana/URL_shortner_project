class ChangeVisitTypeCol < ActiveRecord::Migration
  def change
    remove_column("visits", "short_url_id", :string)
    add_column("visits", "short_url_id", :integer)
  end
end
