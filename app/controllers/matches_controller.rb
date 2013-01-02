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

    if same_players?(teamA,teamB)
      flash[:error] = 'O mesmo jogador não pode estar em dois times'
    else
      @match = Match.create(params[:match])
      if @match.save 
          flash[:success] = 'Partida criada'
          save_players(teamA,teamB)
          redirect_to @match

      else 
          render 'new'
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

  def save_players(teamA,teamB)
    m = Match.find(@match.reload.id)
    teamA.each do |tA|
      if m.goals_team_a > m.goals_team_b
        res = "W"
      elsif m.goals_team_a < m.goals_team_b     
        res = "L"
      else
        res = "D"
      end
      p = Player.find(tA)
      pm = p.PlayerMatches.build(match_id: m.id,team:"A",result: res )
      pm.save  
    end

    teamB.each do |tB|
      if m.goals_team_b > m.goals_team_a
        res = "W"
      elsif m.goals_team_b < m.goals_team_a     
        res = "L"
      else
        res = "D"
      end
      p = Player.find(tB)
      pm = p.PlayerMatches.build(match_id: m.id,team:"B",result: res )
      pm.save  
    end

    
  end 


end
