class AssignmentsController < ApplicationController
	load_and_authorize_resource param_method: :assignment_params

	def index
		@assignments = Assignment.all
	end

	def new
		@assignment = Assignment.new
	end

	def create
		@assignment = Assignment.new(assignment_params)
		if @assignment.save
			redirect_to assignments_path, notice: "Assignment created"
			# redirect_to cohorts_path(params[:cohort_id]), notice: "Assignment added."
		else
			redirect_to :back, alert: "Failed to save."
		end
	end

	def show
		@assignment = Assignment.find(params[:id])
		@new_comment = @assignment.comments.build
		@assignment.comments.build
		@new_comment.user_id = current_user
	end

	def destroy
		@assignment = Assignment.find(params[:id])
		if @assignment.destroy
			redirect_to assignments_path
		else
			redirect_to assignments_path
		end
	end

	private

	def assignment_params
		params.require(:assignment).permit!
	end

end	