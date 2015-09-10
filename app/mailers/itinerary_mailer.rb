class ItineraryMailer < ActionMailer::Base
  default from: "no-reply@triprender.com"


  def itinerary(recipient_email, itinerary_body)
  	email = recipient_email
  	@body = itinerary_body
  	mail(to: email,
  		   subject: "Your selected itinerary from TripRender.com!")
  end
end
