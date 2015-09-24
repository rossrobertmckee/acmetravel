module Api
  module Tripadvisor
    class Geocache

      def self.tripadvisor(lat, lon) 

        url = "http://api.tripadvisor.com/api/partner/2.0/map/#{lat},#{lon}?key=#{Figaro.env.tripadvisor_dev_key}"

        response = HTTParty.get(url)
        return response
      end


    end
  end
end