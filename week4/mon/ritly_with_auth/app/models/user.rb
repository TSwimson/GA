# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
    has_secure_password
    before_save :create_remember_token
    before_save { email.downcase! }
    validates :name, presence: true, length: {maximum: 50}
    validates :password, length: {minimum: 6}
    validates :password_confirmation, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence:   true,
                   format:     { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }
    private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end


#markus's validation code

# before_save { |user| user.email = email.downcase }

# 	validates :name, presence: true, length: { maximum: 50 }
# 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# 	validates :email, presence:   true,
# 	                format:     { with: VALID_EMAIL_REGEX },
# 	                uniqueness: { case_sensitive: false }
# 	validates :password, presence: true, length: { minimum: 6 }
# 	validates :password_confirmation, presence: true