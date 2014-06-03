class LocationsController < ApplicationController

	def index
		@locations = Location.all
	end

	def new
		@location = Location.new
	end

	def create
		@location = Location.new(location_params)
		if @location.save
			redirect_to locations_path
		else
			redirect_to new_location_path
		end
	end

	def update
		@location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to locations_path
    else
      "Error updating location"
    end
	end

	def show
		@location = Location.find(params[:id])
	end

	def destroy
		@location = Location.find(params[:id])
		if @location.destroy
			redirect_to locations_path
		else
			redirect_to location_path
		end
	end

	private

	def location_params
		params.require(:location).permit!
	end

end