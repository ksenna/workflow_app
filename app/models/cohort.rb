class Cohort < ActiveRecord::Base

	has_many :users
	has_many :assignments
	belongs_to :location
	belongs_to :course

	accepts_nested_attributes_for :assignments

end