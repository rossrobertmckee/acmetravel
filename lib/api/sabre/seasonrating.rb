module Api
  module Sabre
    class Seasonrating

    	def self.season(location) 

    		auth = { "Authorization" => Figaro.env.sabre_auth_key }
				url = "https://api.test.sabre.com/v1/historical/flights/#{location}/seasonality"

				response = HTTParty.get(url, headers: auth)
				return response
    	end


    end
  end
end
