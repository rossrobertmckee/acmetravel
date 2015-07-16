module Api
  module Weather
    class Weather

    	 def self.weather

        response = HTTParty.get("https://community-open-weather-map.p.mashape.com/weather?callback=test&lang=-en&q=Los+Angeles%2C+CA&units=imperial",
              headers:{
                "X-Mashape-Key" => "wBBIwgJX80mshFoc7H8NHrkbuCFHp1Nzt1djsnAg5UzAJxT1Kt",
                "Accept" => "application/json"
                }
              )
              
				return response

    	end

    end
  end
end


