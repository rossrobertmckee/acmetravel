module Api
  module Weather
    class Weather

    	 def self.weather(city) 

    		auth = { "X-Mashape-Key" => "wBBIwgJX80mshFoc7H8NHrkbuCFHp1Nzt1djsnAg5UzAJxT1Kt", "Accept" => "application/json" }
				url = "https://george-vustrey-weather.p.mashape.com/api.php?location=#{city}"
				response = HTTParty.get(url, headers: auth)

				return response
    	end

    end
  end
end


