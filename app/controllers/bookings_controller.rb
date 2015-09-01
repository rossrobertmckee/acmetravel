class BookingsController < ApplicationController

	def search
			@booking_link = Api::Sabre::Booking.flights(params[:link])
			@booking_flights = BookingData.new(JSON.parse(@booking_link.body)["PricedItineraries"])
  end
end

# test_link_data = JSON.parse(File.read('config/data/test_link_data.json'))






# @bookinglink = Api::Sabre::Booking.flights(params[:link])
# @link_itineraries = JSON.parse(@bookinglink.body)
# @air_itineraries = []
# @air_itineraries << @link_itineraries["PricedItineraries"]
# @name_array = Array.new
# @departure_and_arrival_array = @name_array