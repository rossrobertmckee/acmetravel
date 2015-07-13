module Api
  module Google
    class Api

    	def self.flights(origin, destination) 

				api_key = Sabre.env.google_auth_key
				url = "https://www.googleapis.com/qpxExpress/v1/trips/search?key=#{api_key}"


				request = {
				  "request" => {
				    "slice" => [
				      {
				        "origin" => origin,
				        "destination" => destination,
				        "date" => "2015-07-15"
				      }
				    ],
				    "passengers" => {
				      "adultCount" => 1,
				      "infantInLapCount" => 0,
				      "infantInSeatCount" => 0,
				      "childCount" => 0,
				      "seniorCount" => 0
				    },
				    "solutions" => 20,
				    "refundable" => false
				  }
				}.to_json
				response = HTTParty.post(url, body: request, headers: { 'Content-Type' => 'application/json' } )
				return response
    	end


      def initialize
      end

      def flights
      end
 
    end
  end
end