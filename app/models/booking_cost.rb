class BookingCost
	attr_accessor :total_fare
	def initialize(raw_data)
		self.total_fare = raw_data["AirItineraryPricingInfo"]["PTC_FareBreakdowns"]["PTC_FareBreakdown"]["PassengerFare"]["TotalFare"]["Amount"]
	end

end