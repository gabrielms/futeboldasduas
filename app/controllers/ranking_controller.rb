class RankingController < ApplicationController
  def index
  	@ranking = Ranking.order("points DESC, goals_differential DESC").all
  end

  def show
  	@ranking = Ranking.find(params[:id])
  end
end
