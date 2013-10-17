require 'spec_helper'

describe Comment do
	it { should allow_mass_assignment_on :user_id }
	it { should allow_mass_assignment_on :link_id }
	it { should allow_mass_assignment_on :parent_comment_id }

	let(:link) { FactoryGirl.build(:link) }
	let(:root_comment) { FactoryGirl.build(:root_comment) }
	let(:child_comment) { FactoryGirl.build(:child_comment) }
	let(:grandchild_comment) { FactoryGirl.build(:grandchild_comment) }

	it "should allow child comments" do
		expect(root_comment.comments).to include(child_comment)
	end

	it "should access parent comments" do
		expect(child_comment.parent).to eq(root_comment)
	end

	it "should include grandchild when searching for comments by parent_id" do
		expect(link.comments_by_parent_id(link)).to eq({ root_comment => { child_comment => grandchild_comment } })
	end

end
