class BookingCost
	attr_accessor :total_fare, :flight_data, :destination_title, :origin_title, :departure_date_title, :return_date_title, :mail_test
	def initialize(raw_data)
		@raw_data = raw_data
		self.total_fare = booking_fare
		self.flight_data = booking_other_data
		self.destination_title = destination_title
		self.origin_title = origin_title
		self.departure_date_title = departure_date_title
		self.return_date_title =	return_date_title
		self.mail_test = mail_test
	end

	def booking_fare
		@raw_data["AirItineraryPricingInfo"]["PTC_FareBreakdowns"]["PTC_FareBreakdown"]["PassengerFare"]["TotalFare"]["Amount"]
	end

	def booking_other_data
		@raw_data["AirItinerary"]["OriginDestinationOptions"].each do |k, legs| 
			return legs
		end
	end

	def destination_title
		@raw_data["AirItinerary"]["OriginDestinationOptions"].each do |k, legs| 
			legs.each do |flight_segment|
				arrival = flight_segment["FlightSegment"].last
				arrival_city = arrival["ArrivalAirport"]["LocationCode"]
				return arrival_city
			end
		end
	end

		def origin_title
		@raw_data["AirItinerary"]["OriginDestinationOptions"].each do |k, legs| 
			legs.each do |flight_segment|
				departure = flight_segment["FlightSegment"].first
				departure_city = departure["DepartureAirport"]["LocationCode"]
				return departure_city
			end
		end
	end

		def departure_date_title
		@raw_data["AirItinerary"]["OriginDestinationOptions"].each do |k, legs| 
			legs.each do |flight_segment|
				date = flight_segment["FlightSegment"].first
				departure_date = (date["DepartureDateTime"].to_time).strftime("%A, %B %-d")
				return departure_date
			end
		end
	end

		def return_date_title
		@raw_data["AirItinerary"]["OriginDestinationOptions"].each do |k, legs|
			date = legs.last["FlightSegment"]
			date.each do |x|
				return_date = (x["DepartureDateTime"].to_time).strftime("%A, %B %-d")
				return return_date
			end
		end
	end

end


