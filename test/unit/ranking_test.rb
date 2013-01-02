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

require 'test_helper'

class RankingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
