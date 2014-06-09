class SocialUser < User

	attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

	def has_facebook?
		accounts.where(provider: 'facebook').any?
	end

end