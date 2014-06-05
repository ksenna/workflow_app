class User < ActiveRecord::Base
	
	has_secure_password

	validates_presence_of :email
	validates_uniqueness_of :email

	has_many :comments
	has_many :assignments
	has_many :submissions
	has_many :admissions

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

	# def from_omniauth(auth)
	# 	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |u|
	# 		u.provider = auth.provider
	# 		u.uid = auth.uid
	# 		u.name = auth.info.name
	# 		u.oauth_token = auth.credentials.oauth_token
	# 		u.oauth_expires_at = Time.at(auth.credentials.expires_at)
	# 		u.save!
	# 	end
	# end
end