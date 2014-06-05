require 'koala'

class AuthsController < ApplicationController

	def facebook
		user = User.from_omniauth
		@facebook_token = request.env['omniauth.auth']
		@graph = Koala::Facebook::API.new(oauth_access_token)
	end

end