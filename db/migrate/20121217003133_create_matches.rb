class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :date
      t.integer :goals_team_a
      t.integer :goals_team_b
      t.timestamps
    end
  end
end
