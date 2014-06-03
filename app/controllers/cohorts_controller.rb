class CohortsController < ApplicationController

	def index
		@cohorts = Cohort.all
		@locations = Location.all 
		@courses = Courses.all
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
		@cohort = Cohort.find(params[:id])
    if @cohort.update(cohort_params)
      redirect_to cohort_path, notice: "Your cohort was updated"
    else
      redirect_to cohort_path, notice: "Error updating cohort"
    end
	end

	def show
		@cohort = Cohort.find(params[:id])
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