class AddIndextoShortenedUrlsTable < ActiveRecord::Migration
  def change
    add_index("shortened_urls", "submitter_id", unique: true)
  end
end
