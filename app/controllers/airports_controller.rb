class AirportsController < ApplicationController
	autocomplete :airport, :city, :display_value => :auto_complete

def autocomplete
end

end
