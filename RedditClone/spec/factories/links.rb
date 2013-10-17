# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :link do
		user_id 1
		sub_id 1
		title "I drew Dr. Robotnik & Sonic"
		body "What do you guys think?"
		url "http://www.reddit.com/r/gaming/comments/1onpw8/i_drew_dr_robotnik_sonic/"
	end
end
