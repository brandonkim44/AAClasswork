# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#
class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :session_token, uniqueness: { scope: :email}
    validates :password_digest, presence: true
    validates :password, presence: true, length: { minimum: 7, allow_nil: true}

    after_initialize :ensure_session_token
    attr_reader :password

    def self.find_by_credentials(email, password) #passed in as strings in params { user => {username: x, password: y}
        #must be a class method because it User.find_by method and done to find an instance of user
        user = User.find_by(email: email)  #checking to see if email is in DB
        return user if user && BCrypt::Password.new(user.password_digest).is_password?(password) #checks for matching PW to email
        nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

end
