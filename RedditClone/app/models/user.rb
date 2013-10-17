require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :name, :username, :password
	validates :name, :username, :password_digest, presence: true
	before_validation( on: :create ) do
		self.reset_session_token! unless self.session_token
	end

	def password=(password)
		self.password_digest = BCrypt::Password.create(password)
		self.save!
	end

	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def self.generate_session_token
		SecureRandom::urlsafe_base64(16)
	end

	def reset_session_token!
		self.session_token = User.generate_session_token
		self.save!
	end

	def self.find_by_credentials(username, password)
		user = User.find_by_username(username)

		if user
			return user if user.is_password?(password)
		end
	end
end
