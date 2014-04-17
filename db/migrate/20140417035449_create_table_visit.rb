class CreateTableVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer "visitor_id"
      t.string "short_url"
      
      t.timestamp    
    end
  end
end
