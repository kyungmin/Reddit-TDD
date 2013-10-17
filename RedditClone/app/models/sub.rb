class Sub < ActiveRecord::Base
  attr_accessible :name, :user_id
	validates :name, :user_id, presence: true
	# validates :name, presence: true

	belongs_to(
	:moderator,
	:class_name => "User",
	:foreign_key => :user_id,
	:primary_key => :id,
	:inverse_of => :moderated_subs
	)

	has_many(
	:links,
	:class_name => "Link",
	:foreign_key => :sub_id,
	:primary_key => :id,
	:inverse_of => :sub
	)

	# validates :links, presence: true
end
