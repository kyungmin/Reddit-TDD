require 'spec_helper'

describe Sub do
	it { should allow_mass_assignment_of(:name) }
	it { should allow_mass_assignment_of(:user_id) }

	let(:moderator) { FactoryGirl.build(:moderator) }
	let(:non_moderator) { FactoryGirl.build(:non_moderator) }

	it "should allow at most 5 links at the same time" do
		subreddit = FactoryGirl.build(:sub)
		fake_links = []
		6.times do |counter|
			subreddit.links.build({ :user_id => 2, :title => "#{counter}", :url => "www.lol.com/#{counter}" })
		end
		expect(subreddit).not_to be_valid
	end

	# it "should be only editable by the moderator" do
	# 	expect(sub)
	# end
end
