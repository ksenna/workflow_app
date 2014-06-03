class User < ActiveRecord::Base
	
	has_secure_password

	validates_presence_of :email
	validates_uniqueness_of :email

	has_many :comments
	has_many :assignments
	has_many :submissions

	belongs_to :cohort
	belongs_to :role

	def admin?
		role.name == "admin"
	end

	def instructor?
		role.name == "instructor"
	end

	def student?
		role.name == "student"
	end
	
end