class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
    	t.string :code
    	t.float	:lat
    	t.float	:lon
    	t.string :name
    	t.string :city
    	t.string :state
    	t.string :country
    	t.integer :woeid
    	t.string :tz
    	t.string :phone
    	
    	t.string :email
    	t.string :url
    	t.integer :runway_length
    	t.integer :elev
    	t.string :icao
    	t.integer :direct_flights
    	t.integer :carriers


      t.timestamps
    end

        add_index :airports, [:code, :name, :city]
        add_index   :airports, [:code, :lat, :lon]
        add_index   :airports, [:code, :woeid]
        add_index :airports, :code
        add_index :airports, :name
        add_index :airports, :city
        add_index :airports, :woeid
  end
end
