 class BookingData
  def initialize(raw_data)
    @raw_data = raw_data
  end


  def self.booking_segment
  	@booking_segment ||= @raw_data["PricedItineraries"].map do |booking_segment_json|
  		BookingSegment.new(booking_segment_json)
  	end
  end
end



  # def fare
  # 	@bookings ||= @raw_data.map do |fare_json|
  # 		Booking.new(fare_json)
  # 	end
  # end