class PlayersController < ApplicationController
  def index
    @player = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(params[:player])
    if @player.save
      flash[:success] = 'Jogador salvo com sucesso'
      redirect_to @player
    else
      render 'new'
    end    
  end

  def destroy
    Player.find(params[:player]).destroy
  end
end
