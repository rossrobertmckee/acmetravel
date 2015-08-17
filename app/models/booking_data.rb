class BookingData
  def initialize(raw_data)
    @raw_data = raw_data
  end

  def bookings
  	@bookings ||= @raw_data.map do |booking_json|
  		Booking.new(fare_json)
  	end
  end
end
