# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :root_comment do
		user_id 2
		link_id 1
		parent_comment_id nil
		body "What a great link!"
  end

	factory :child_comment do
		user_id 3
		link_id 1
		parent_comment_id 1
		body "I agree!!"
	end

	factory :grandchild_comment do
		user_id 4
		link_id 1
		parent_comment_id 2
		body "Totally!!"
	end

	factory :new_link do
		user_id 1
		sub_id 1
		title "I drew Dr. Robotnik & Sonic"
		body "What do you guys think?"
		url "http://www.reddit.com/r/gaming/comments/1onpw8/i_drew_dr_robotnik_sonic/"
	end
end
