class Admin::GamesController < Admin::BaseController
  
  def index
    @games = Game.all
  end

  def create

  end

  def update

  end

  def destroy
    
  end
end