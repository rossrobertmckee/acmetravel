class FlightsController < ApplicationController

	def index
	end
	
	def new
		@flight = Flight.new
	end

	def search
		@results = []
		@results2 = []
		
		#if params[:search][:earliestdeparture].blank?
    	@response = Api::Sabre::Latest.flights(params[:search])
    	@results << JSON.parse(@response.body)
    	#@weather = Api::Weather::Weather.weather
    	#@temperature = JSON.parse(@weather)
    	# @response2 = Api::Sabre::Broadrange.flights(params[:origin], params[:destination])
    	# @json_hash_of_flight_data = JSON.parse(@response2)
    #end
    	@random = ["Bucks", "Smackers", "Dolla Dolla Bills", "Dollars", "Benjamins" ]
    	@money = @random.sample
  end

  def show
  end

end

# What needs to happen:  Build upon "Destination finder" by either using all the premade destinations and loping through, or
# -- finding a way to do a multiple destination search with broad dates. 
# Multiple airport codes? Run each request?  Place in to array => each do?  This applies to the multiple destinations. 
# Tripadvisor -- how would the airport code be pulled, ran through trip advisor API, and then spit out at results?
# -- WOuld it be an additional step in the controller?
# ----- How would I do this for other things, like dollar per mile, 
# Weather feature updated daily -- Same as above, plus to roun through search. 
# Try as many different search ideas as possible.  Request multiple different searches compiled in to one result.
# -- Multiple modals?  How would that be carried out?  User.session? cache?

# The user selects a destination criteria, it passes through the search controller, the search controller runs through
# -- the if statements, stops on selected criteria, that criteria has a prebuilt array, the search then cycles through
# --- each city in the array, adding each result to results-array.  Those results need to be organized. 
# ---- or can all of them be placed in the API at once?