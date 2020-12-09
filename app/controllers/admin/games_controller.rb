class Admin::GamesController < Admin::BaseController
  
  def index
    @games = Game.all
    @column_names = Game.column_names
    @column_names_non_visible = []
    
  end

  def create

  end

  def update

  end

  def destroy
    
  end
end