class AddTripadvisorGeoCode < ActiveRecord::Migration
  def change
  	add_column :airports, :tripadvisor_city_geo_code, :integer
  end
end
