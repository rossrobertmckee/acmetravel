class FlightData
  def initialize(raw_data)
    @raw_data = raw_data
  end

  def fares
  	@fares ||= @raw_data.map do |fare_json|
  		Fare.new(fare_json)
  	end
  end

  def lowestfare
  	fares.min { |a, b| a.lowest_fare <=> b.lowest_fare }
  end

  def sort_by_lowest_fare
  	fares.sort { |a, b| a.lowest_fare <=> b.lowest_fare }
  end
end

