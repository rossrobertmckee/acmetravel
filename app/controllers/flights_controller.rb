class FlightsController < ApplicationController

	def index
	end
	
	def new
		@flight = Flight.new
	end

  def search
    response = Api::Sabre::Latest.flights(params[:search])
    if response["status"] == "NotProcessed"
      flash[:warning] =  "It worked 1"
      redirect_to root_path
    elsif response["status"] == "Complete"
      flash[:warning] =  "It worked 2"
      redirect_to root_path
    else
      @flight_data = FlightData.new(JSON.parse(response.body)["FareInfo"])
    if params[:temperature_limit] == "bring_the_heat"
      @results = @flight_data.group_by_airport_after_temp_remove
    else
      @results = @flight_data.group_by_airport
    end
  end
  end

  def show
  end

end


#   def search
#     @results = []
#       @response = Api::Sabre::Latest.flights(params[:search])
#         if @response["staus"] = "Not Processed"
#           redirect_to root_path
#         else
#       @results << JSON.parse(@response.body)
#   end
# end