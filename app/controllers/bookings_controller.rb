class BookingsController < ApplicationController

	def search
  		@bookinglink = Api::Sabre::Booking.flights(params[:link])
  		@link_itin = JSON.parse(@bookinglink.body)
  		@air_itineraries = []
  		#link_itin["PricedItineraries"].each do |priced_itinerary|
        @air_itineraries << @link_itin["PricedItineraries"]

  			#priced_itinerary["AirItinerary"]["OriginDestinationOptions"]["OriginDestinationOption"].each do |origin_destination_option|
         # @air_itineraries << origin_destination_option["FlightSegment"]
          
  			#end
  		#end
  end


end

#["FlightSegment"]
#origin_destination_option["FlightSegment"]