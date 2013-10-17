require 'bcrypt'

FactoryGirl.define do
	factory :user do
		name "Ben Lee"
		username "kkslider"
		password_digest BCrypt::Password.create("password")
	end
end