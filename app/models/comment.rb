class Comment < ActiveRecord::Base

	belongs_to :user
	belongs_to :assignment
	belongs_to :submission
	belongs_to :commentable, polymorphic: true

end