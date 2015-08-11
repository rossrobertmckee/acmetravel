class AirportsController < ApplicationController
	autocomplete :airport, :city, :extra_data => [:code], :display_value => :auto_complete

end
