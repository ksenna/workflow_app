class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			redirect_to courses_path
		else
			redirect_to new_course_path
		end
	end

	def update
		@course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to courses_path
    else
      "Error updating course"
    end
	end

	def show
		@course = Course.find(params[:id])
	end

	def destroy
		@course = Course.find(params[:id])
		if @course.destroy
			redirect_to courses_path
		else
			redirect_to course_path
		end
	end

	private

	def course_params
		params.require(:course).permit!
	end

end