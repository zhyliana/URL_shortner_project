class Visit < ActiveRecord::Base
  belongs_to(:visitors, 
             :class_name => "User", 
             :primary_key => :id, 
             :foreign_key => :visitor_id
             )
             
  belongs_to(:visited_urls, 
             :class_name => "ShortenedUrl", 
             :primary_key => :id, 
             :foreign_key => :short_url_id
             )
  
  def self.record_visit!(user, shortened_url)    
    Visit.new(:visitor_id => user.id, :short_url_id => shortened_url.id).save!
  end
  
  def num
    Visit.count(:visitor_id)
  end
  
  def num_uniques
    Visit.distinct.count(:visitor_id)
  end
  
  def num_recent_uniques
    Visit.distinct.count(:visitor_id)
  end
end