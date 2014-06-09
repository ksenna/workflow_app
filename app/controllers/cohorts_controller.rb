class CohortsController < ApplicationController

	def index
		if current_user.instructor?
			@cohorts = current_user.taught_cohorts
		else
			@cohorts = current_user.cohorts
		end
		@locations = Location.all 
		@courses = Course.all
	end

	def new
		@cohort = Cohort.new
	end

	def create
		@cohort = Cohort.new(cohort_params)
		if @cohort.save
			redirect_to cohorts_path
		else
			redirect_to new_cohort_path
		end
	end

	def update
		@cohort.update_attributes(cohort_params)
    if @cohort.update(cohort_params)
      redirect_to cohort_path, notice: "Your cohort was updated"
    else
      redirect_to cohort_path, notice: "Error updating cohort"
    end
	end

	# def show
	def main
		@cohort = Cohort.find(params[:id])
		# if current_user.admin?
		# 	render partial: "instructor"
		# elsif @user.instructor?
		# 	render partial: "instructor"
		# else @user.student?
		# 	render partial: "student"
		# end
	end

	def destroy
		@cohort = Cohort.find(params[:id])
		if @cohort.destroy
			redirect_to cohorts_path
		else
			redirect_to cohort_path
		end
	end

	private

	def cohort_params
		params.require(:cohort).permit!
	end

end