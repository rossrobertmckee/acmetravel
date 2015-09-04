class ItineraryMailer < ActionMailer::Base
  default from: "no-reply@triprender.com"

  def test
  	recipient_email = ""
  	itinerary_body = "hello"
  	x = ItineraryMailer.itinerary("#{recipient_email}", "#{itinerary_body}")
  	x.deliver
  end

  def itinerary(recipient_email, itinerary_body)
  	email = recipient_email
  	body = itinerary_body
  	mail(to: email,
  		   subject: "Your selected itinerary from TripRender.com!",
  		   body: body)
  end

end
