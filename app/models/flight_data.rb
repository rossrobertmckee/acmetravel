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

  def group_by_airport
    fare_group_by_airport = {}
    sort_by_lowest_fare.each do |fare|
      fare_array = fare_group_by_airport[fare.destination_location]
      if fare_array.blank? 
        fare_group_by_airport[fare.destination_location] = [fare]
      else
        fare_group_by_airport[fare.destination_location] << fare
      end
    end
    return fare_group_by_airport
  end


end

