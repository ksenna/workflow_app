class SubmissionsController < ApplicationController

	def index
		@submissions = current_user.submissions.all 
	end

	def show
		@submission = Submission.find(params[:id])
		@new_comment = @submission.comments.build
		@submission.comments.build
	end

	def new
		@submission = Submission.new
	end

	def create
		if @user.is? "student"
			@submission = current_user.submissions.build(submission_params)
			if @submission.save
				redirect_to assignment_path(params[:assignment_id]), notice: "Item added."
			else
				redirect_to :back, notice: "Failed to save."
			end
		end
	end

	def update
		
	end

	private

	def submission_params
		params.require(:submission).permit!
	end
end
