class BookingsController < ApplicationController

	def search
  	@booking_link = Api::Sabre::Booking.flights(params[:link])
  	@booking_flights = BookingData.new(JSON.parse(@booking_link.body)["PricedItineraries"])
    city_code = (@booking_flights.booking_cost.first).destination_title
    image_path = "../assets/#{city_code}.jpg"
    if File.exist?(Rails.root.join('app', 'assets', 'images', "#{city_code}.jpg"))
      @image = image_path
    else
      @image = "../assets/coastbanner.jpg"
    end
  end

  def mail
  	recipient_email = params[:email]
  	itinerary_body = params[:body]
  	x = ItineraryMailer.itinerary("#{recipient_email}", "#{itinerary_body}")
  	x.deliver
  	redirect_to :back
	end


end