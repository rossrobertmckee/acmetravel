class FlightsController < ApplicationController

	def index
	end
	
	def new
		@flight = Flight.new
	end

	def search
    	response = Api::Google::Api.flights(params[:origin], params[:destination])
    	trips = JSON.parse(response.body)["trips"]
    	@response = trips
  	end


end


# ["data"]["airport"]