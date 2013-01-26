class RankingController < ApplicationController
  def index
  	@ranking = Ranking.order("points DESC, percent DESC, victories DESC, 
  														goals_differential DESC, goals_scored DESC").all
  end

  def show
  	@ranking = Ranking.find(params[:id])
  end
end
