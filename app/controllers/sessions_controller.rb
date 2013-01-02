# encoding: utf-8
class SessionsController < ApplicationController

	def new    
  end
  
  def create 
    if (params[:session][:login])#.match(/\A[\w-]{5,15}\z/i) 
      user = Player.find_by_user(params[:session][:login])
    end
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_path
    else
      flash.now[:error] = 'Combinação errada de nome de usuário e senha.'
      render 'new'
    end
  end
  
  def destroy 
    sign_out
    redirect_to root_path   
  end
  
end
