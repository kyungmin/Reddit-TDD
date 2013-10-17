require 'spec_helper'

describe User do

	it { should allow_mass_assignment_of(:name) }
	it { should allow_mass_assignment_of(:username) }
	it { should allow_mass_assignment_of(:password) }

	it "should not allow password to be stored" do
		expect(FactoryGirl.create(:user, :password => "password").password_digest) == "password"
	end

	it "should have a session token after sign up" do
		expect(FactoryGirl.create(:user).session_token).not_to be_nil
	end

	# it "signing up" do
	# 	visit '/users/new'
	# 	fill_in 'Username', :with => 'user@example.com'
	# 	fill_in 'Password', :with => 'password'
	#
	# 	click_link 'Sign Up'
	# 	page.should have_content 'Sign Out'
	# end
	#
	# it "signs me in" do
	# 	visit '/session/new'
	# 	fill_in 'Username', :with => 'user@example.com'
	# 	fill_in 'Password', :with => 'password'
	#
	# 	click_link 'Sign In'
	# 	page.should have_content 'Sign Out'
	# end
	#
	# it "logs me out" do
	# 	click_link 'Sign Out'
	# 	page.should have_content 'Sign In'
	# end

	let(:a_user) { a_user = FactoryGirl.create(:user, :password => "password" ) }
	it "should find users by credentials" do
		expect(User.find_by_credentials(a_user.username, "password")).to eq(a_user)
	end


end

