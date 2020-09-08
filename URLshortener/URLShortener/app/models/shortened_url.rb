class ShortenedUrl < ApplicationRecord
    validates :user_id, :long_url, presence: true 
    validates :short_url, uniqueness: true, presence: true

    def self.random_code(long_url)
        short_url = SecureRandom::urlsafe_base64
        if !ShortenedUrl.exists?(short_url)
            ShortenedUrl.new(short_url, long_url, user_id)
        end
    end
end


# ID  SHORTURL  LONG URL   USER_ID
# 1    "/1234"  "/superlongurl"  1
