class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password_digest, :session_token, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    # FIG VAPER

    attr_reader :password
    after_initialize :ensure_session_token


    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
        return @user if (@user && BCrypt::Password.new(self.password_digest).is_password?(password))
        nil
    end


    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    private

    def self.generate_session_token
        SecureRandom.urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

end