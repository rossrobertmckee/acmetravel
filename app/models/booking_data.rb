 class BookingData
  def initialize(raw_data)
    @raw_data = raw_data
  end


  def booking_segment
  	@booking_segment ||= @raw_data.map do |booking_segment_json|
  		Booking.new(booking_segment_json["AirItinerary"]["OriginDestinationOptions"]["OriginDestinationOption"])
  	end
  end

  def breakdown_to_segment
    @raw_data.each do |breakdown_to_segment|
     breakdown_to_segment["AirItinerary"]["OriginDestinationOptions"]["OriginDestinationOption"]
  end


  def booking_cost
  	@booking_cost ||= @raw_data.map do |total_fare_json|
  		BookingCost.new(total_fare_json)
  	end
  end
end