class FlightsController < ApplicationController

	def index
	end
	
	def new
		@flight = Flight.new
	end

  def search
    response = Api::Sabre::Latest.flights(params[:search])
    @flight_data = FlightData.new(JSON.parse(response.body)["FareInfo"])
    @results = @flight_data.group_by_airport
    @money = ["Bucks", "Smackers", "Dolla Dolla Bills", "Dollars", "Benjamins" ].sample
  end

# 	def search
# 		@results = []
	
#     	@response = Api::Sabre::Latest.flights(params[:search])
#     		if @response["staus"] = "Not Processed"
#     			redirect_to root_path
#     		else
#     	@results << JSON.parse(@response.body)
#     	@random = ["Bucks", "Smackers", "Dolla Dolla Bills", "Dollars", "Benjamins" ]
#     	@money = @random.sample
#   end
# end

  def show
  end

end





# Add each search result in to an array through a DO and output the array for pagination.
# Multiple airport codes? Run each request?  Place in to array => each do?  This applies to the multiple destinations. 
# Weather feature updated daily -- Same as above, plus to roun through search. 
# The user selects a destination criteria, it passes through the search controller, the search controller runs through
# -- the if statements, stops on selected criteria, that criteria has a prebuilt array, the search then cycles through
# --- each city in the array, adding each result to results-array.  Those results need to be organized. 
# ---- or can all of them be placed in the API at once?