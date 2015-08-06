class BookingsController < ApplicationController

	def search
  		@bookinglink = Api::Sabre::Booking.flights(params[:link])
  		@link_itin = JSON.parse(@bookinglink.body)
  		@air_itineraries = []
      @air_itineraries << @link_itin["PricedItineraries"]
  end
end

#["FlightSegment"]
#origin_destination_option["FlightSegment"]