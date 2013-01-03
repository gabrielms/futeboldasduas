#encoding: utf-8
# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Match < ActiveRecord::Base
  attr_accessible :date

  has_many :PlayerMatches
  has_many :Players, :through => :PlayerMatches

  
  validates_uniqueness_of :date, message: "Já existe uma partida criada nesta data"



 
end

