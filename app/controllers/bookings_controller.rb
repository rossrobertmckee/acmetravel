class BookingsController < ApplicationController

	def search
  		@bookinglink = Api::Sabre::Booking.flights(params[:link])
  		@linkitin = JSON.parse(@bookinglink.body)
  		@air_itineraries = []
  		@linkitin["PricedItineraries"].each do |priced_itinerary|
  			priced_itinerary["AirItinerary"]["OriginDestinationOptions"]["OriginDestinationOption"].each do |origin_destination_option|
  				@air_itineraries << origin_destination_option["FlightSegment"]
  			end
  		end
  end


end
