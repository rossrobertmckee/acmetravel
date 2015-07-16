class BookingsController < ApplicationController

	def search
  		@bookinglink = Api::Sabre::Booking.flights(params[:link])
  		@linkitin = JSON.parse(@response.body)
  end

 def show
  		@bookinglink2 = Api::Sabre::Booking.flights(params[:link])
  		@linkitin2 = JSON.parse(@bookinglink2.body)

 end


end
