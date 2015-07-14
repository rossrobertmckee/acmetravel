module Api
  module Sabre
    class Earliestandlatest

    	def self.flights(options) 
    		origin = options[:origin]
    		latestdeparture = options[:latestdeparture]
    		earliestdeparture = options[:earliestdeparture]
    		lengthofstay = options[:lengthofstay]
    		maxprice = options[:maxprice]

    		auth = { "Authorization" => Figaro.env.sabre_auth_key }
				url = "https://api.test.sabre.com/v1/shop/flights/fares?origin=#{origin}&earliestdeparturedate=#{earliestdeparture}&latestdeparturedate=#{latestdeparture}&lengthofstay=#{lengthofstay}&maxfare=#{maxprice}&pointofsalecountry=US&topdestinations=50"

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