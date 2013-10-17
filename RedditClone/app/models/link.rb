class Link < ActiveRecord::Base
  attr_accessible :user_id, :sub_id, :title, :body, :url
	# validates :user_id, :sub_id :title, :url, presence: true
	validates :title, :url, presence: true

	belongs_to(
	:author,
	:class_name => "User",
	:foreign_key => :user_id,
	:primary_key => :id,
	:inverse_of => :links
	)

	belongs_to(
	:sub,
	:class_name => "Sub",
	:foreign_key => :sub_id,
	:primary_key => :id,
	:inverse_of => :links
	)

	has_many(
	:comments,
	:class_name => "Comment",
	:foreign_key => :link_id,
	:primary_key => :id,
	:inverse_of => :link
	)
	validates :sub, presence: true
	# validates :author, :sub, presence: true
end
