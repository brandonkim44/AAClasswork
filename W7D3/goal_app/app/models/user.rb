class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true
    validates :password, length: { minimum: 6, allow_nil: true}

    attr_reader :password
    
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
end