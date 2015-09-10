 class BookingData
  def initialize(raw_data)
    @raw_data = raw_data
  end

  def booking_cost
  	@booking_cost ||= @raw_data.map do |total_fare_json|
  		BookingCost.new(total_fare_json)
  	end
  end

end