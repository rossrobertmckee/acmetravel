module Api
  module Sabre
    class Latest

    	def self.flights(options) 
        # query_options = {pointofsalecountry: "US", topdestinations: "50"}
        options[:origin] = options[:origin].split(' - ').first
    		query = options.map { |k, v| "#{k}=#{v}" unless v.blank? }.compact.join("&")
    		puts query

    		auth = { "Authorization" => Figaro.env.sabre_auth_key }
				url = "https://api.test.sabre.com/v1/shop/flights/fares?#{query}&pointofsalecountry=US&topdestinations=50"

				response = HTTParty.get(url, headers: auth)
				return response
    	end


      def initialize
      end

      def flights
      end
 
    end
  end
end

#origin, latestdeparture, lengthofstay, maxprice
#Figaro.env.sabre_auth_key