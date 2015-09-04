class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
    	t.string :airline
    	t.string :iata_code

      t.timestamps
    end
  end
end
