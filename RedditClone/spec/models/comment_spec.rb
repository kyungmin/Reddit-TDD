require 'spec_helper'

describe Comment do
	it { should allow_mass_assignment_of :user_id }
	it { should allow_mass_assignment_of :link_id }
	it { should allow_mass_assignment_of :parent_comment_id }

#	let(:new_link) { FactoryGirl.create(:new_link) }
	let(:root_comment) { FactoryGirl.create(:root_comment) }
	let(:child_comment) { FactoryGirl.create(:child_comment) }
	let(:grandchild_comment) { FactoryGirl.create(:grandchild_comment) }

	it "should allow child comments" do
		new_link = FactoryGirl.create(:new_link)
		p new_link
		# p root_comment
		# p child_comment
		# p grandchild_comment

		# p root_comment
		# p root_comment.child_comments
		# p child_comment.parent_comment
		expect(root_comment.child_comments).to include(child_comment)

	end

	it "should access parent comments" do
		expect(child_comment.parent_comment).to eq(root_comment)
	end

	it "should include grandchild when searching for comments by parent_id" do
		expect(link.comments_by_parent_id(link)).to eq({ root_comment => { child_comment => grandchild_comment } })
	end

end
