class RemoveUniquenessFromSubmitterId < ActiveRecord::Migration
  def change
    remove_index("shortened_urls", column: "submitter_id")
  end
end
