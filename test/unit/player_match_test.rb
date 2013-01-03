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

require 'test_helper'

class PlayerMatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
