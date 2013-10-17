# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
		name "Animals"
		user_id 1
  end

  factory :moderator do
		name "Kyungmin Kim"
		username "kyungminkk"
		password "password"
  end

  factory :non_moderator do
		name "Ben Lee"
		username "kkslider"
		password "password"
  end
end
