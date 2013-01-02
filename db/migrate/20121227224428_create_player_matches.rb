class CreatePlayerMatches < ActiveRecord::Migration
  def change
  	create_table :player_matches do |t|
  		t.integer :match_id
  		t.integer :player_id
  		t.string  :team 
  		t.string  :result

  		t.timestamps
  	end	
  end
end
