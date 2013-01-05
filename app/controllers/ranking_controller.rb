class RankingController < ApplicationController
  def index
  	@ranking = Ranking.all
  end

  def show
  	@ranking = Ranking.find(params[:id])
  end
end
