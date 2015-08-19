class BookingsController < ApplicationController

	def search
			@booking_link = Api::Sabre::Booking.flights(params[:link])
			@booking_flights = BookingData.new(JSON.parse(@booking_link.body))
  end
end








# @bookinglink = Api::Sabre::Booking.flights(params[:link])
# @link_itineraries = JSON.parse(@bookinglink.body)
# @air_itineraries = []
# @air_itineraries << @link_itineraries["PricedItineraries"]
# @name_array = Array.new
# @departure_and_arrival_array = @name_array