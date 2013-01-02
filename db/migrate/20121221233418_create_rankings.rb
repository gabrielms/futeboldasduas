class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :player
      t.decimal :percent
      t.integer :points
      t.integer :matches
      t.integer :victories
      t.integer :draws
      t.integer :losses
      t.integer :goals_scored
      t.integer :goals_against
      t.integer :goals_differential
      t.timestamps
    end
  end
end
