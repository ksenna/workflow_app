class Assignment < ActiveRecord::Base

	belongs_to :cohort
	has_and_belongs_to_many :users
	has_many :submissions
	has_many :comments, as: :commentable, dependent: :destroy

	# scope :cohort_assignments, -> { where(:cohort_id => cohort.id) }

end