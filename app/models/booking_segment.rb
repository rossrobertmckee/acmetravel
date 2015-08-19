 class BookingSegment < BookingData
  def initialize(raw_data)
    @raw_data = raw_data
  end

  def self.booking_cost
  	@booking_cost ||= @raw_data["AirItineraryPricingInfo"].map do |booking_cost_json|
  		self.booking_cost(booking_cost_json)
  	end
  end
 end


  # def booking
  # 	@booking ||= @raw_data.map do |booking_json|
  # 		Booking.new(booking_json)
  # 	end
  # end