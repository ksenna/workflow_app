class User < ActiveRecord::Base
	
	has_secure_password

	validates_presence_of :email
	validates_uniqueness_of :email

	has_many :comments
	has_many :assignments
	has_many :submissions
	has_many :admissions
	has_many :cohorts, through: :admissions # referring to student's cohort

	has_many :taught_cohorts, class_name: "Cohort", foreign_key: "instructor_id" # referring to the instructor's cohorts

	# belongs_to :cohort
	belongs_to :role

	scope :instructors, -> { joins(:role).where('roles.name = ? ', "instructor") }

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