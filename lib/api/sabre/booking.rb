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
#"Bearer T1RLAQKI7JV3QDV4T2QSEZu2ctkIzpKGGRCDk0z+YUqBKiF6z72Ntp83AACg3AH36UxSrPswHu1wE4/o0UhZNtGdgBDslf0wpCCorKY8U/ak12mPx11OYI5q0/ti6gTDwNPUz/EFvomAYJMIp522+Hw5ofy3SxU+pILZ7vmu3Fc3cKhUjQ6yDu7yZ5e4P23jskNSFkCrNf/e6iKawmpTDUKnFXE3JrEriDvwxQeHUsmh4OI3aBY50sIZmZYpVrvx7xWaxvf7QSes2kKwWw**"