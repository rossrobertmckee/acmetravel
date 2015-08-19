class Booking
	attr_accessor :departure_airport, :arrival_airport, :departure_date_time, :arrival_date_time, 
								:flight_number, :total_fare
	def initialize(raw_data)
		@raw_data = raw_data
		#self.departure_airport = raw_data["PricedItineraries"]["AirItinerary"]["OriginDestinationOptions"]["OriginDestinationOption"]["FlightSegment"]["DepartureAirport"]["LocationCode"]
		#self.arrival_airport = raw_data["PricedItineraries"]["AirItinerary"]["OriginDestinationOptions"]["OriginDestinationOption"]["FlightSegment"]["ArrivalAirport"]["LocationCode"]
		#self.departure_date_time = raw_data["PricedItineraries"]["AirItinerary"]["OriginDestinationOptions"]["OriginDestinationOption"]["FlightSegment"]["DepartureDateTime"]
		#self.arrival_date_time = raw_data["PricedItineraries"]["AirItinerary"]["OriginDestinationOptions"]["OriginDestinationOption"]["FlightSegment"]["ArrivalDateTime"]
		#self.flight_number = raw_data["PricedItineraries"]["AirItinerary"]["OriginDestinationOptions"]["OriginDestinationOption"]["FlightSegment"]["FlightNumber"]
		
	end

	# def total_fare
	# 	@raw_data["PricedItineraries"]["AirItineraryPricingInfo"]["PTC_FareBreakdowns"]["PTC_FareBreakdown"]["PassengerFare"]["TotalFare"]["Amount"]
	# end

end
["PricedItineraries"]  <--- This needs to be added