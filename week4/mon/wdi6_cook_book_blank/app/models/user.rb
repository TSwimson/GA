# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
    attr_accessible :email, :name, :password, :password_confirmation
    before_save :create_remember_token
    has_secure_password
    
    private

    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end 
end
