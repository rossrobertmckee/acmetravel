module Api
  module Tripadvisor
    class Api

      def self.tripadvisor(geo_id) 

        url = "http://api.tripadvisor.com/api/partner/2.0/location/#{geo_id}?key=#{Figaro.env.tripadvisor_dev_key}"

        response = HTTParty.get(url)
        return response
      end


    end
  end
end