class UsersController < ApplicationController
	skip_filter :ensure_logged_in, only: [:new, :create]

	def new
		@new_user = User.new
	end

	def create
		@new_user = User.new(user_params)
		respond_to do |format|
			if @new_user.save
				UserMailer.welcome_email(@new_user).deliver
				format.html { redirect_to 'users#home', notice: "You signed up!" }
				format.json { render json: @new_user, status: :created, location: @new_user }
				# redirect_to login_path, notice: "You signed up!"
			else
				format.html { render action: 'new', notice: "Registration failed." }
				format.json { render json: @new_user.errors, status: :unprocessable_entity }
				# render :new, notice: "Registration failed."
			end
		end
	end

	def dashboard
		@user = current_user
		if @user.admin?
			render partial: "instructor"
		elsif @user.instructor?
			render partial: "instructor", layout: "../users/dashboard"
		else @user.student?
			render partial: "student", layout: "../users/dashboard"
		end
				
		# @active_cohort = @user.cohort_id
		# @all_cohorts = Cohort.includes(:users).where('@user.cohort_id = ?', '@cohort.id')
		# @my_cohorts = Cohort.where("cohort.id" => @user.cohort_id)

	end

	def destroy
		if @user.destroy
			redirect_to login_path, alert: "You are no longer enrolled."
		else
			render user_dashboard_path(current_user), alert: "There was an error deleting your account."
		end
	end

	private

	def user_params
		params.require(:user).permit!
	end
end