class BookingsController < ApplicationController

	def search
			@booking_link = Api::Sabre::Booking.flights(params[:link])
			@booking_flights = BookingData.new(JSON.parse(@booking_link.body)["PricedItineraries"])
  end

  def mail
  	recipient_email = params[:email]
  	itinerary_body = params[:body]
  	x = ItineraryMailer.itinerary("#{recipient_email}", "#{itinerary_body}")
  	x.deliver
  	redirect_to :back
	end
end
