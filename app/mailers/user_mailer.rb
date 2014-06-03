class UserMailer < ActionMailer::Base

	default from: 'ahsmashsenna@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'http://example.workflowapp.com/login'
		mail(to: @user.email, subject: 'Welcome to Workflow App!')
	end

end