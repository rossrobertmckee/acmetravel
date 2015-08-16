class UpdateWeatherForAirports < ActiveRecord::Migration
  def change
  	add_column :airports, :current_low_temp, :integer
  end
end
