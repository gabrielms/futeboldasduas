# == Schema Information
#
# Table name: rankings
#
#  id                 :integer          not null, primary key
#  player_id          :integer
#  percent            :decimal(, )
#  points             :integer
#  matches            :integer
#  victories          :integer
#  draws              :integer
#  losses             :integer
#  goals_scored       :integer
#  goals_against      :integer
#  goals_differential :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Ranking < ActiveRecord::Base
  attr_accessible :player_id, :draws, :goals_against, :goals_differential, 
                  :goals_scored, :losses, :matches, :percent, :points, :victories

  belongs_to :player

  def update_ranking
  	
  	Player.all.each do |p|
  		r = Ranking.new
      
  		Ranking.where(player_id: p.id).any? ? (r = Ranking.where(player_id: p.id).first) : r.player_id = p.id
      r.matches = PlayerMatch.where(player_id: p.id).count
  		r.draws = PlayerMatch.where(player_id: p.id,result: "D").count
  		r.losses = PlayerMatch.where(player_id: p.id,result: "L").count
  		r.victories = PlayerMatch.where(player_id: p.id,result: "V").count
  		r.points = r.draws + (r.victories*3)
      r.goals_scored  = PlayerMatch.where(player_id: p.id).map{ |e| e.goals_scored }.sum
  		r.goals_against = PlayerMatch.where(player_id: p.id).map{ |e| e.goals_against }.sum
      r.goals_differential = r.goals_scored - r.goals_against
      r.percent = r.points / (r.matches * 3).to_f * 100
  		r.save
     
    end
  		
  end	

end
