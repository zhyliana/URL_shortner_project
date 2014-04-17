class ShortenedUrl < ActiveRecord::Base
  has_many(:visits, 
           :primary_key => :id, 
           :foreign_key => :submitter_id, 
           :class_name => "Visit"
           )
  
  has_many(:visitors, 
           :through => :visits, 
           :source => :visitors
           )
           
  belongs_to(:submitter, 
             :class_name => "User", 
             :primary_key => :id, 
             :foreign_key => :submitter_id 
            )
  
  def self.random_code
    code = SecureRandom.urlsafe_base64
    
    until self.all.pluck(:short_url).include?(code) == false
      code = SecureRandom.urlsafe_base64
    end
    
    code
  end
  
  def self.create_for_user_and_long_url!(user, long_url)
    short_url = self.random_code
    user_id = user.id
    
    shortened_url = ShortenedUrl.new(:short_url => short_url, :long_url => long_url, :submitter_id => user_id) 
    shortened_url.save!
    shortened_url
  end

  
end