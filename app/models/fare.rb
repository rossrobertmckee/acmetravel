class Fare
	attr_accessor :currency_code, :lowest_non_stop_fare, :lowest_fare, :destination_location, 
								:departure_date_time, :return_date_time, :theme, :links
	def initialize(raw_data)
		self.currency_code = raw_data["CurrencyCode"]
		self.lowest_non_stop_fare = raw_data["LowestNonStopFare"]
		self.lowest_fare = raw_data["LowestFare"]
		self.destination_location = raw_data["DestinationLocation"]
		self.departure_date_time = raw_data["DepartureDateTime"]
		self.return_date_time = raw_data["ReturnDateTime"]
		self.theme = raw_data["Theme"]
		self.links = raw_data["Links"]
	end
end