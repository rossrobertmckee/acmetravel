module Api
  module Sabre
    class Booking

    	def self.flights(link)
        limit_link_returns = (link + "&limit=25")

    		auth = { "Authorization" => Figaro.env.sabre_auth_key }
				url = "#{limit_link_returns}"

				response = HTTParty.get(url, headers: auth)
				return response
    	end

 
    end
  end
end

#https://api.test.sabre.com/v1/shop/flights?origin=JFK&destination=SDQ&departuredate=2015-07-16&returndate=2015-07-18&pointofsalecountry=US&limit=40
