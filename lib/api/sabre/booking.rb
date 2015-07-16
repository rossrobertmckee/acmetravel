module Api
  module Sabre
    class Booking

    	def self.flights(link) 

    		auth = { "Authorization" => Figaro.env.sabre_auth_key }
				url = "#{link}"

				response = HTTParty.get(url, headers: auth)
				return response
    	end

 
    end
  end
end

#https://api.test.sabre.com/v1/shop/flights?origin=JFK&destination=SDQ&departuredate=2015-07-16&returndate=2015-07-18&pointofsalecountry=US