class ShortenedUrL < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, presence: true, uniqueness: true
    validates :user_id, presence: true

  def self.random_code
    loop do 
      short_url = SecureRandom.urlsafe_base64
        if !ShortenedUrL.exists?(short_url)
          create_shortened_url(short_url)
            break
        end
    end 
  end  

  def create_shortened_url(short_url)
    ShortenedUrL.create!(long_url: 'long_url.com', short_url: short_url, user_id: self.submitter) 
  end


  belongs_to :submitter
    primary_key: :id,
    foreign_key: :email,
    class_name: :User
end
