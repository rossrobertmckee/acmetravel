class FlightsController < ApplicationController

	def index
	end
	
	def new
		@flight = Flight.new
	end

  def search
    response = Api::Sabre::Latest.flights(params[:search])
    @flight_data = FlightData.new(JSON.parse(response.body)["FareInfo"])
    @results = @flight_data.sort_by_lowest_fare
    @money = ["Bucks", "Smackers", "Dolla Dolla Bills", "Dollars", "Benjamins" ].sample
  end

	# def search
	# 	@results = []
	
 #    	@response = Api::Sabre::Latest.flights(params[:search])
 #    	@results << JSON.parse(@response.body)
 #    	@random = ["Bucks", "Smackers", "Dolla Dolla Bills", "Dollars", "Benjamins" ]
 #    	@money = @random.sample
 #  end

  def show
  end

end


# OPtions in Latest API.  What does it mean?
# Add each search result in to an array through a DO and output the array for pagination.
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