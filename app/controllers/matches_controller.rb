#encoding:utf-8
class MatchesController < ApplicationController
  def index
      @match = Match.all
  end

  def show
      @match = Match.find(params[:id])
  end

  def create
    teamA = params[:players_ids_A] 
    teamB = params[:players_ids_B]

    goals_team_a = params[:goals_team_a] 
    goals_team_b = params[:goals_team_b]

    if same_players?(teamA,teamB) 
      flash[:error] = 'O mesmo jogador não pode estar em dois times'
    else
      @match = Match.create(params[:match])
      if @match.save && save_players(teamA,teamB,goals_team_a,goals_team_b)
          flash[:success] = 'Partida criada'
          redirect_to @match

      else
          flash[:error] = 'Erro ao criar partida' 
          redirect_to novapartida_path
      end
    end
  end

  def new
    @match = Match.new
  end

  def destroy
  end

  private

  def same_players?(teamA,teamB)
    teamA.any?{|arr| teamB.include?(arr)}
  end

  def save_players(teamA,teamB,goals_team_a,goals_team_b)
    m = Match.find(@match.reload.id) unless @match.nil?
    
    teamA.each do |tA|
      p = Player.find(tA)
      pm = p.PlayerMatches.build(match_id: m.id,team:"A",goals_against: goals_team_b,
                                 goals_scored: goals_team_a)
      pm.save  
    end
    teamB.each do |tB|
      p = Player.find(tB)
      pm = p.PlayerMatches.build(match_id: m.id,team:"B",goals_against: goals_team_a,
                                 goals_scored: goals_team_b)
      pm.save  
    end

    
  end 


end
