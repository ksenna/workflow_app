class Submission < ActiveRecord::Base

	belongs_to :users
	belongs_to :assignment
	has_many :comments, as: :commentable, dependent: :destroy

end