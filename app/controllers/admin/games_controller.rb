class Admin::GamesController < Admin::BaseController
  
  def index
    @games = Game.all

    @column_names = Game.column_names

    @column_names_non_visible = []

    @urls_d = []
    @urls_e = []
    @games.each do |game|
      @urls_d << admin_game_path(game)
      @urls_e << edit_admin_game_path(game)
    end
    
  end

  def new
    
  end

  def create

  end

  def edit
    
  end

  def update

  end

  def destroy
    
  end
end