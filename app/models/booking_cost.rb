class BookingCost
	attr_accessor :total_fare
	def initialize(raw_data)
		@raw_data = raw_data
		self.total_fare = raw_data["AirItineraryPricingInfo"]["PTC_FareBreakdowns"]["PTC_FareBreakdown"]["PassengerFare"]["TotalFare"]["Amount"]
	end

	# def flight_segment
	# 	@raw_data["PricedItineraries"]["AirItineraryPricingInfo"]["PTC_FareBreakdowns"]["PTC_FareBreakdown"]["PassengerFare"]["TotalFare"]["Amount"]
	# end
end


# try breakdown of flights here under each fare