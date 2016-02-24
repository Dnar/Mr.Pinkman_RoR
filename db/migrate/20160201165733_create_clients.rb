class CreateClients < ActiveRecord::Migration
  def change
  	create_table :clients do |t|
  		t.string :name
  		t.string :phone
  		t.string :datestamp
  		t.string :barber
  		t.string :color
  		
  		t.timestamps null: false
  	end
  end
end