# == Schema Information
#
# Table name: player_matches
#
#  id         :integer          not null, primary key
#  match_id   :integer
#  player_id  :integer
#  team       :string(255)
#  result     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlayerMatch < ActiveRecord::Base
  attr_accessible :match_id, :player_id, :team, :result

   belongs_to :player
   belongs_to :match

   #validates_presence_of :team, :result

 
end
