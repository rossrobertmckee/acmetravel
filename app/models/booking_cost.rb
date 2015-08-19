class BookingCost < BookingSegment
	attr_accessor :total_fare
	def initialize(raw_data)
		self.total_fare = raw_data["PTC_FareBreakdowns"]["PTC_FareBreakdown"]["PassengerFare"]["TotalFare"]["Amount"]
	end

end