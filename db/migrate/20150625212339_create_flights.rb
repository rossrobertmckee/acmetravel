class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
    	t.integer :adultcount
    	t.integer :childcount
    	t.integer :infantlapcount
    	t.integer :infantseatcount
    	t.integer :seniorcount

    	t.string :origin
    	t.string :destination
    	t.string :departuredate

    	t.string :maxprice

      t.timestamps
    end
  end
end
