class CreatesShortenedUrlTable < ActiveRecord::Migration
  def change
    create_table "shortened_urls" do |t|
      t.string "short_url"
      t.string "long_url"
      t.integer "submitter_id"
      
      t.timestamp
    end
  end
end
