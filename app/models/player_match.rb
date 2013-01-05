# == Schema Information
#
# Table name: player_matches
#
#  id            :integer          not null, primary key
#  match_id      :integer
#  player_id     :integer
#  goals_scored  :integer
#  goals_against :integer
#  team          :string(255)
#  result        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PlayerMatch < ActiveRecord::Base
  attr_accessible :match_id, :player_id, :team, :result, :goals_scored, :goals_against

  after_save :set_result

  belongs_to :player
  belongs_to :match


  validates_presence_of :team, :goals_scored, :goals_against
  
  protected
  	def set_result
  		if goals_scored > goals_against
        res = "V"
      elsif goals_scored < goals_against     
        res = "L"
      else
        res = "D"
      end
      self.connection.execute("UPDATE player_matches SET result = '#{res}'
      												WHERE player_matches.id = #{self.id}")
      	
 		end
 
end
