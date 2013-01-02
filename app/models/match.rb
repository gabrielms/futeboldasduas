#encoding: utf-8
# == Schema Information
#
# Table name: matches
#
#  id           :integer          not null, primary key
#  date         :date
#  goals_team_a :integer
#  goals_team_b :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Match < ActiveRecord::Base
  attr_accessible :date, :goals_team_a, :goals_team_b, :PlayerMatch_ids

  has_many :PlayerMatches
  has_many :Players, :through => :PlayerMatches

  validates_presence_of :goals_team_a, :goals_team_b
  validates_uniqueness_of :date, message: "Já existe uma partida criada nesta data"



 
end

