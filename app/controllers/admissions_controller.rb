class AdmissionsController < ApplicationController

	def index
		@admissions = Admission.all
	end

	def new
		@admission = Admission.new
	end

	def create
		@admission = Admission.new(admission_params)
		if @admission.save
			redirect_do user_path, alert: "You have been enrolled!"
		else
			render :new, alert: "There was an error processing your enrollment."
		end
	end

	def update
		if @admission.update_attributes(admission_params)
			redirect_do user_path, alert: "Admission updated"
		else
			render :back, alert: "There was an error updating."
		end
	end

	def show
		@admission = Admission.find(params[:id])
	end

	def destroy
		if @admission.destroy
			redirect_do user_path, alert: "You are no longer enrolled."
		else
			render :back, alert: "There was an error deleting."
		end
	end

	private

	def admission_params
		params.require(:admission).permit!
	end

end