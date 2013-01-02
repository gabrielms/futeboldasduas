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
  attr_accessible :player_id,:draws, :goals_against, :goals_differential, :goals_scored, :losses, :matches, :percent, :points, :victories

  has_many :players
end
