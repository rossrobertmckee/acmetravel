class Airline < ActiveRecord::Base
	validates :iata_code, uniqueness: true

	def self.build_from_json(raw_data) 
		a = Airline.new
		a.airline = raw_data["airline"]
		a.iata_code = raw_data["iata_code"]
		a.web_site = raw_data["web_site"]
		a.reservations_number = raw_data["reservations_number"]
    return a
	end
	
	def self.load_data
		airline_data = JSON.parse(File.read('config/data/airline_data.json'))
			airline_data.each do |breakdown_data|
				airline_data_variable = self.build_from_json(breakdown_data)
				airline_data_variable.save
			end
		end
end
