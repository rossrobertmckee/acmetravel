class Airport < ActiveRecord::Base
	belongs_to :Airports
	validates :code, uniqueness: true
	scope :greater_than_72, -> {where("current_high_temp >?", 72)}
	scope :major_airports, -> {where("direct_flights >?", 20)}

	def self.build_from_json(raw_data) 
		a = Airport.new
		a.code = raw_data["code"]
		a.lat = raw_data["lat"]
		a.lon = raw_data["lon"]
		a.name = raw_data["name"]
		a.city = raw_data["city"]
		a.state = raw_data["state"]
		a.country = raw_data["country"]
		a.woeid = raw_data["woeid"]
    a.tz = raw_data["tz"]
    a.phone = raw_data["phone"]
    a.email = raw_data["email"]
    a.url = raw_data["url"]
    a.runway_length = raw_data["runway_length"]
    a.elev = raw_data["elev"]
    a.icao = raw_data["icao"]
    a.direct_flights = raw_data["direct_flights"]
    a.carriers = raw_data["carriers"]
    return a
	end
	
	def self.load_data
		airport_data = JSON.parse(File.read('config/data/airport_data.json'))
			airport_data.each do |breakdown_data|
				breakdown_data.delete("type")
				airport_data_variable = self.build_from_json(breakdown_data)
				airport_data_variable.save
			end
		end

  def self.update_weather
  	airports = Airport.all
  	airports.map do |weather_update|
  		lat = weather_update.lat
  		lon = weather_update.lon
  		response = Api::Weather::Weather.weather(lat, lon)
			begin
				parsed_response = JSON.parse(response.body)
				results_parsed_to_temp_high = parsed_response["query"]["results"]["channel"]["item"]["forecast"][0]["high"]
				results_parsed_to_temp_low = parsed_response["query"]["results"]["channel"]["item"]["forecast"][0]["low"]
				high_temp_in_f = (results_parsed_to_temp_high.to_i * 2) + 30
				low_temp_in_f = (results_parsed_to_temp_low.to_i * 2) + 30
				weather_update.update(current_high_temp: "#{high_temp_in_f}")
				weather_update.update(current_low_temp: "#{low_temp_in_f}")
			rescue
				weather_update.update(current_high_temp: "0")
				weather_update.update(current_low_temp: "0")
			end
  	end
  end

  def self.update_tripadvisor_geo_code
  	airports = Airport.all
  	airports.map do |geo_code_update|
  		lat = geo_code_update.lat
  		lon = geo_code_update.lon
  		response = Api::Tripadvisor::Geocache.tripadvisor(lat, lon)
  		begin
  			tripadvisor_city_geo_code = JSON.parse(response.body)["data"][0]["ancestors"][0]["location_id"]
  			geo_code_update.update(tripadvisor_city_geo_code: "#{tripadvisor_city_geo_code}")
  		rescue
  			geo_code_update.update(tripadvisor_city_geo_code: "0")
  		end
  	end
  end
  
  def self.update_airports
  	airports = Airport.all
  	airports.map do |remove_small_airports|
			total_direct_flights = remove_small_airports.direct_flights
			if total_direct_flights < 5
				remove_small_airports.destroy
			end
		end
	end

	def auto_complete
    "#{self.code} - #{self.city}"
  end

  def self.image(img)

  	ActionController::Base.helpers.image_tag("#{img}.jpg")
  end


end	


