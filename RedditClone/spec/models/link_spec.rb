require 'spec_helper'

describe Link do
	let(:new_link) { FactoryGirl.build(:new_link) }
	it "should have link" do
		expect(new_link).to be_valid
	end

	it { should allow_mass_assignment_of(:title) }
	it { should allow_mass_assignment_of(:url) }
	it { should allow_mass_assignment_of(:sub_id) }
	it { should allow_mass_assignment_of(:user_id) }
	it { should allow_mass_assignment_of(:body) }
end
