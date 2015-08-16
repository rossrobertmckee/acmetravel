class AddWeatherToAirports < ActiveRecord::Migration
  def change
  		add_column :airports, :current_high_temp, :integer
  end
end
