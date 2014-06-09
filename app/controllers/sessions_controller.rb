class SessionsController < ApplicationController
	skip_filter :ensure_logged_in

	def new
	end

	def create
		if request.env["omniauth.auth"].present?
			oauth = OAuthUser.new(request.env["omniauth.auth"], current_user)
			oauth.login_or_create
			session[:user_id] = oauth.user.id
			redirect_to root_path
		else
			user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
	  	if user
	  		session[:user_id] = user.id
	  		redirect_to user_dashboard_path(current_user), notice: "Logged in"
	  	else
	  		flash.now.alert = "Invalid email or password"
	  		render :new
	  	end
	  end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, notice: "You logged out!"
	end
end