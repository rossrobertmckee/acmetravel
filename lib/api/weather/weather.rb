module Api
  module Weather
    class Weather

      def self.weather(lat, lon) 

        auth = { "X-Mashape-Key" => Figaro.env.mashape_key }
        url = "https://simple-weather.p.mashape.com/weatherdata?lat=#{lat}&lng=#{lon}"

        response = HTTParty.get(url, headers: auth)
        return response
      end


    end
  end
end


