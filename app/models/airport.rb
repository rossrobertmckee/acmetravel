class Airport < ActiveRecord::Base
	validates :code, uniqueness: true
	attr_accessor :code, :lat, :lon, :name, :city, :state, :country, :woeid,
                :tz, :phone, :email, :url, :runway_length, :elev, :icao,
                :direct_flights, :carriers

	def self.build_from_json(raw_data) 
		self.code = raw_data["code"]
		self.lat = raw_data["lat"]
		self.lon = raw_data["lon"]
		self.name = raw_data["name"]
		self.city = raw_data["city"]
		self.state = raw_data["state"]
		self.country = raw_data["country"]
		self.woeid = raw_data["woeid"]
    self.tz = raw_data["tz"]
    self.phone = raw_data["phone"]
    self.email = raw_data["email"]
    self.url = raw_data["url"]
    self.runway_length = raw_data["runway_length"]
    self.elev = raw_data["elev"]
    self.icao = raw_data["icao"]
    self.direct_flights = raw_data["direct_flights"]
    self.carriers = raw_data["carriers"]
	end
	
	def self.load_data
		airport_data = JSON.parse(File.read('config/data/airport_data.json'))
			airport_data.map do |breakdown_data|
				self.build_from_json(breakdown_data)
			end
		end

	
	# validates :lat, uniqueness: true
	# validates :lon, uniqueness: true
	validates :name, uniqueness: true
	# validates :city, uniqueness: true
	# validates :state, uniqueness: true
	# validates :country, uniqueness: true
	# validates :woeid, uniqueness: true
	# validates :tz, uniqueness: true
	# validates :phone, uniqueness: true
	# validates :type, uniqueness: true
	# validates :email, uniqueness: true
	# validates :url, uniqueness: true
	# validates :runway_length, uniqueness: true
	# validates :elev, uniqueness: true
	validates :icao, uniqueness: true
	# validates :direct_flights, uniqueness: true
	# validates :carriers, uniqueness: true


end
