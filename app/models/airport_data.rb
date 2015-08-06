class AirportData
  def initialize(raw_data)
    @raw_data = raw_data
  end

  def self.load_data
  	@info ||= @raw_data.map do |info_json|
  		Airport.new(info_json)
  	end
  end

end


airport_data = JSON.parse(File.read('config/data/airport_data.json'))

AirportData.new(airport_data)
