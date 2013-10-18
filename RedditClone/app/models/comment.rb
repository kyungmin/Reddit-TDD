class Comment < ActiveRecord::Base
  attr_accessible :user_id, :link_id, :body, :parent_comment_id
	# validates :user_id, :link_id, :body, presence: true
	validates :body, presence: true
	# validates :author, :link

	belongs_to(
	:link,
	:class_name => "Link",
	:foreign_key => :link_id,
	:primary_key => :id,
	:inverse_of => :comments
	)

	belongs_to(
	:parent_comment,
	:class_name => "Comment",
	:foreign_key => :parent_comment_id,
	:primary_key => :id
	# :inverse_of => :child_comments
	)

	has_many(
	:child_comments,
	:class_name => "Comment",
	:foreign_key => :parent_comment_id,
	:primary_key => :id
	# :inverse_of => :parent_comment
	)


	belongs_to(
	:author,
	:class_name => "User",
	:foreign_key => :user_id,
	:primary_key => :id,
	:inverse_of => :comments
	)
end
