class AddMoreDataToAirline < ActiveRecord::Migration
  def change
  	add_column :airlines, :web_site, :string
  	add_column :airlines, :reservations_number, :string
  end
end
