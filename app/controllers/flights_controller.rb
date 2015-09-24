class FlightsController < ApplicationController

	def index
	end
	
	def new
		@flight = Flight.new
	end

  def search
    maxfare = (params[:search])[:maxfare]
    response = Api::Sabre::Latest.flights(params[:search])
    if response["status"] == "NotProcessed"
      flash[:warning] =  "Something you entered was not valid. Maybe the airport code?"
      redirect_to root_path
    elsif response["status"] == "Complete" && ((maxfare.to_i) < 200)
      flash[:warning] =  "No results were found! Double check the airport code, or maybe try forking out a little more cash?"
      redirect_to root_path
    elsif response["status"] == "Complete"
      flash[:warning] =  "No results were found, please try again."
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

  def generate
  end

end

